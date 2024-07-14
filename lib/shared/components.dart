
//Button
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/styles/icon_broken.dart';


Widget defaultButton(
      {
        Color color = Colors.blue,
        double width = double.infinity,
        double radius = 20.0,
        bool isUpperCase = true,
        required String text,
        required VoidCallback function,
      }) => Container(
        color: color,
        width: width,
        height: 40.0,
        child: Container(
          child: MaterialButton(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            onPressed: function,
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
                ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
    );


//TextFormField
Widget defaultTFF({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String label,
  required String? Function(String?) validate,
  Widget? prefixIcon,
  IconData? suffixIcon,
  bool obscureText = true,
  VoidCallback? suffixPressed,
  void Function(String)? onchange,
  void Function(String)? onSubmit,
  VoidCallback? onTap,
}) => TextFormField(
  controller: controller,
  keyboardType: textInputType,
  decoration: InputDecoration(
    counterStyle: TextStyle(
      color: Colors.deepOrange,
      backgroundColor:  Colors.deepOrange,
    ),
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon,)) : null ,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey), // Border color when enabled
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepOrange), // Border color when focused
    ),
  ),
  validator: validate,
  obscureText: obscureText,
  onTap: onTap,
  onChanged: onchange,
  onFieldSubmitted: onSubmit,

);


Widget Sperator()
{
  return Padding(
    padding: const EdgeInsets.only(left: 20.0,),
    child: Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    ),
  );
}


Future<Object?> navigateTo(context, widget)
{
  return Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => widget,
      ),
      );
}

void navigateAndFinish(context , widget)
{
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route){
      return false;
      },
  );
}

Widget defaultTextButton({
  required String text,
  required VoidCallback function,
})
{
  return  TextButton(
    onPressed: function,
    child: Text(text.toUpperCase(),
      style: TextStyle(
      ),),
  );
}

void showToast({
  required String text,
  required ToastStates state,
}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);


enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
})
{
   return AppBar(
     leading: IconButton(
       onPressed: () {
         Navigator.pop(context);
       },
       icon: Icon(
         IconBroken.Arrow___Left_2,
       ),
     ),
     title: Text(
         title),
     actions: actions,
     titleSpacing: 0.0,
   );
}


