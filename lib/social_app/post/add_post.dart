import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddPostScreen extends StatelessWidget {

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, SocialStates state) {  },
      builder: (BuildContext context, SocialStates state) {
        return Scaffold(
          appBar:  defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                text: 'Post',
                function: (){
                  var now = DateTime.now();

                  if(SocialCubit.get(context).postImage == null)
                  {
                    SocialCubit.get(context).createPost(
                      dateTime: now.toString(),
                      text: textController.text,
                    );
                  }else{
                    SocialCubit.get(context).uploadPostImage(
                      dateTime: now.toString(),
                      text: textController.text,
                    );
                  }
                },),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(height: 10.0,),
                Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/cute-monkey-standing-cartoon-vector-icon-illustration-animal-nature-icon-isolated-flat-vector_138676-12045.jpg?t=st=1720412334~exp=1720415934~hmac=1cca63487fe5c6ea9b033f2b4788333039a3b406248ce9b7ad276fcb3b4d953c&w=740',),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Abdullah Ashraf',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      label: Text('what is in your mind'),
                      labelStyle: TextStyle(
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 140.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image: FileImage(SocialCubit.get(context).postImage!),
                            fit: BoxFit.cover,),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        child: IconButton(
                          onPressed: (){
                            SocialCubit.get(context).removePostImage();
                          },
                          icon: Icon(Icons.close,),
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Image,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Add Photo',),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: (){},
                        child:  Text('# tags',),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
