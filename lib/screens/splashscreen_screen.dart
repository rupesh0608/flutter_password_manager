import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/screens/login_screen.dart';
import 'package:password_manager/screens/signup_screen.dart';
import 'package:password_manager/utils/app_util.dart';

import '../utils/common_util.dart';

class Splashscreen extends StatefulWidget{
  const Splashscreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();

}

class _SplashScreen  extends State<Splashscreen>{
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Util.navigateAndReplace(context,const LoginScreen() )
    );
  }
  @override
  Widget build(BuildContext context) {
    hideStatusBar();
    return Container(
        color: Colors.white,
        child:const Center(
          child:Image(
            height: 150,
            image: AssetImage(ImageConstant.imageSplashBGImage),
          ),
        )
    );
  }
}