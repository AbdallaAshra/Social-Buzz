import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/social_app/post_model.dart';
import 'package:social_app/models/social_app/social_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/social_app/chats/chats_screen.dart';
import 'package:social_app/social_app/feeds/feeds_screen.dart';
import 'package:social_app/social_app/post/add_post.dart';
import 'package:social_app/social_app/settings/settings_screen.dart';
import 'package:social_app/social_app/users/users_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? userModel;
  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
        userModel = SocialUserModel.fromJson(value.data()!);
        emit(SocialGetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    AddPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Add post',
    'Users',
    'Settings',
  ];

  void changeBottomNav(int index)
  {

    if(index == 2)
      emit(SocialNewPostState());
    else{
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  File? profileImage;
  final picker = ImagePicker();
  Future<void> getProfileImage()async
  {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImageSuccessState());
    }else{
      print('no image selected');
      emit(SocialProfileImageErrorState());
    }
  }

  File? coverImage;
  Future<void> getCoverImage()async
  {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImageSuccessState());
    }else{
      print('no image selected');
      emit(SocialCoverImageErrorState());
    }
  }


  void uploadProfileImage({
    required String name,
    required String bio,
    required String phone,
})
  {
    emit(SocialUserUploadLoadingState());
   firebase_storage.FirebaseStorage.instance
        .ref().
    child('users/${Uri.file(profileImage!.path).pathSegments.last}')
    .putFile(profileImage!)
    .then((value){
      value.ref.getDownloadURL().then((value){
        //emit(SocialUploadProfileImageSuccessState());
        updateUser(name: name, bio: bio, phone: phone,image: value);
      }).catchError((error){
        emit(SocialUploadProfileImageErrorState());
      });
    })
    .catchError((error){
      print(error.toString());
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String bio,
    required String phone,
})
  {
    emit(SocialUserUploadLoadingState());
     firebase_storage.FirebaseStorage.instance
        .ref().
    child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value){
      value.ref.getDownloadURL().then((value){
       // emit(SocialUploadCoverImageSuccessState());
        print(value);
        updateUser(name: name, bio: bio, phone: phone,cover: value);
      }).catchError((error){
        emit(SocialUploadCoverImageErrorState());
      });
    })
        .catchError((error){
      emit(SocialUploadCoverImageErrorState());
    });
  }

  // void updateUserImages({
  //   required String name,
  //   required String bio,
  //   required String phone,
  //
  // })
  // {
  //   emit(SocialUserUploadLoadingState());
  //   if(coverImage != null)
  //   {
  //     uploadCoverImage();
  //     print('upload cover here');
  //   }else if(profileImage != null){
  //     uploadProfileImage();
  //     print('upload prof here');
  //   }else if(coverImage != null && profileImage != null){
  //
  //   }
  //   else{
  //     updateUser(name: name, bio: bio, phone: phone);
  //   }
  // }

  void updateUser({
    required String name,
    required String bio,
    required String phone,
    String? cover,
    String? image,
  })
  {
    SocialUserModel model = SocialUserModel(
      name: name,
      bio: bio,
      phone: phone,
      cover: cover ?? userModel!.cover,
      image: image ?? userModel!.image,
      email: userModel!.email,
      uId: userModel!.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .update(model.toMap())
        .then((value){
      getUserData();
    })
        .catchError((error){
      emit(SocialUserUploadErrorState());
    });
  }

  File? postImage;
  void removePostImage()
  {
    postImage = null;
    emit(SocialRemovePostImageState());
  }
  Future<void> getPostImage()async
  {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null)
    {
      postImage = File(pickedFile.path);
      emit(SocialPostImageSuccessState());
    }else{
      print('no image selected');
      emit(SocialPostImageErrorState());
    }
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  })
  {
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value){
      value.ref.getDownloadURL().then((value){
        createPost(
            dateTime: dateTime,
            text: text,
            postImage: value,
        );
        print(value);
      }).catchError((error){
        emit(SocialCreatePostErrorState());
      });
    })
        .catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,

  })
  {
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage??'',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value){
          emit(SocialCreatePostSuccessState());
    })
        .catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }
}