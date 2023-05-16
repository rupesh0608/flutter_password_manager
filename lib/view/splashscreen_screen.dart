import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/view/home_screen.dart';
import 'package:password_manager/view/login_screen.dart';
import 'package:password_manager/view/signup_screen.dart';
import 'package:password_manager/utils/app_util.dart';

import '../utils/common_util.dart';
import '../utils/firebase_auth_util.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<Splashscreen> {
  final _storage=GetStorage();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if(_storage.read(Field.FIELD_LOGIN).toString()!="null") {
        Util.navigateAndReplace(context, const HomeScreen());
      }else{
        Util.navigateAndReplace(context, const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    hideStatusBar();
    return Container(
        color: Colors.white,
        child: const Center(
          child: Image(
            height: 150,
            image: AssetImage(ImageConstant.imageSplashBGImage),
          ),
        ));
  }
}
