import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/styles/icon_broken.dart';
class EditProfileScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (BuildContext context, SocialStates state) {  },
      builder: (BuildContext context, SocialStates state) {
        var userModel =SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        nameController.text = userModel!.name!;
        bioController.text = userModel!.bio!;
        phoneController.text = userModel!.phone!;
        return Scaffold(
          appBar:  defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultTextButton(
                text: 'Update',
                function: (){
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text,);
                  //SocialCubit.get(context).uploadProfileImage();
                },
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is SocialUserUploadLoadingState)
                     LinearProgressIndicator(),
                  if(state is SocialUserUploadLoadingState)
                    SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 180.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0,),
                                    topRight: Radius.circular(4.0,),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null ? NetworkImage(
                                      '${userModel.cover}',) : FileImage(coverImage),
                                    fit: BoxFit.cover,),
                                ),
                              ),
                              CircleAvatar(
                                radius: 20.0,
                                child: IconButton(
                                    onPressed: (){
                                      SocialCubit.get(context).getCoverImage();
                                    },
                                    icon: Icon(IconBroken.Camera),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 55.0,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: profileImage == null ? NetworkImage(
                                  '${userModel.image}',) : FileImage(profileImage),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              child: IconButton(
                                onPressed: (){
                                  SocialCubit.get(context).getProfileImage();
                                },
                                icon: Icon(IconBroken.Camera),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            
                  if(SocialCubit.get(context).coverImage != null || SocialCubit.get(context).profileImage != null)
                     Column(
                       children: [
                         SizedBox(
                           height: 20.0,
                         ),
                         Row(
                         children: [
                           if(SocialCubit.get(context).profileImage != null)
                              Expanded(child: Column(
                                children: [
                                  defaultButton(
                                  text: 'Upload Profile',
                                  function: (){
                                    SocialCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        bio: bioController.text,
                                        phone: phoneController.text,
                                    );
                                  },),
                                  if(state is SocialUserUploadLoadingState)
                                    SizedBox(
                                    height: 5.0,
                                  ),
                                  if(state is SocialUserUploadLoadingState)
                                    LinearProgressIndicator(),
                                ],
                              )),
                          SizedBox(
                            width: 5.0,
                          ),
                           if(SocialCubit.get(context).coverImage != null)
                             Expanded(child: Column(
                               children: [
                                 defaultButton(
                                  text: 'Upload Cover',
                                  function: (){
                                    SocialCubit.get(context).uploadCoverImage(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      phone: phoneController.text,
                                    );
                                  },),
                                 if(state is SocialUserUploadLoadingState)
                                    SizedBox(
                                   height: 5.0,
                                 ),
                                 if(state is SocialUserUploadLoadingState)
                                   LinearProgressIndicator(),
                               ],
                             )),
                         ],),
                       ],),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultTFF(
                      controller: nameController,
                      textInputType: TextInputType.text,
                      label: 'Name',
                      validate: (String? value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'name must not be empty';
                        }
                        return null;
                      },
                    prefixIcon: Icon(IconBroken.User),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTFF(
                    controller: bioController,
                    textInputType: TextInputType.text,
                    label: 'Bio',
                    validate: (String? value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'bio must not be empty';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                        IconBroken.Info_Circle,
                    ),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTFF(
                    controller: phoneController,
                    textInputType: TextInputType.text,
                    label: 'phone number',
                    validate: (String? value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'phone must not be empty';
                      }
                      return null;
                    },
                    prefixIcon: Icon(
                      IconBroken.Call,
                    ),
                    obscureText: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
