import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/social_layout.dart';
import 'package:social_app/network/local/cache_helper.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/styles.dart';
import 'package:social_app/social_app/social_login/cubit/cubit.dart';
import 'package:social_app/social_app/social_login/social_login_screen.dart';

//import 'news/dio_helper.dart';
import 'network/remote/dio_helper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // Import generated firebase_options.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DioHelper.init();
  await CacheHelper.init();

  Widget? widget;

  //bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  //token = CacheHelper.getData(key: 'token');
  uId = CacheHelper.getData(key: 'uId');

  // Handling potential null values with conditional assignment
  // if (onBoarding != null) {
  //   if (token != null && token!.isNotEmpty) {
  //     widget = ShopLayout();
  //   } else {
  //     widget = ShopLoginScreen();
  //   }
  // } else {
  //   widget = OnBoardingScreen();
  // }
  if(uId != null)
  {
    widget = SocialLayout();
  }else{
    widget = SocialLoginScreen();
  }

  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SocialLoginCubit()),
        BlocProvider(create: (BuildContext context) => SocialCubit()..getUserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        //darkTheme: darkTheme,
        //themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
