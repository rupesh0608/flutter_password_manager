
import 'package:flutter/material.dart';

class Util{
  static void  navigateAndReplace(BuildContext context, Widget screen){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => screen ));
  }
  static void  navigateTo(BuildContext context, Widget screen){
    Navigator.push(context,MaterialPageRoute(builder: (context) => screen ));
  }
  static void  clearStackAndNavigateTo(BuildContext context, Widget screen){
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

}

