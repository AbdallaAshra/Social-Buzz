
import 'package:social_app/shared/components.dart';
import 'package:social_app/social_app/social_login/social_login_screen.dart';

import '../network/local/cache_helper.dart';

void signOut (context)
{
  CacheHelper.removeData(key: 'token').then((value){
    if(value!)
    {
      navigateAndFinish(context, SocialLoginScreen());
    }
  });
}

void printFullText(String text)
{
  final pattern =RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token = '';
String? uId = '';