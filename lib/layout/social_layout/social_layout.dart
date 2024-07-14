import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/social_app/post/add_post.dart';
import 'package:social_app/styles/icon_broken.dart';
class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState)
        {
          navigateTo(context, AddPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                icon: Icon(IconBroken.Notification,),
                onPressed: (){},),
              IconButton(
                icon: Icon(IconBroken.Search,),
                onPressed: (){},),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(

            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Paper_Upload),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.User),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                label: 'Settings',
              ),
            ],
            selectedItemColor: Colors.blue,
          ),
        );
      },
    );
  }
}
