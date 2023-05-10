import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/data/enum/Provider.dart';
import 'package:password_manager/data/enum/storage_keys.dart';
import 'package:password_manager/data/shared_preference.dart';
import 'package:password_manager/screens/login_screen.dart';
import 'package:password_manager/screens/signup_screen.dart';
import 'package:password_manager/utils/app_util.dart';
import 'package:password_manager/utils/firebase_auth_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/common_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(onPressed:(){
            logout(context);
          }, child: const Text("Logout"))),
    );
  }
}

logout(BuildContext context) async {
  googleSignOut(() => {
    if(context.mounted)
     Util.clearStackAndNavigateTo(context,const LoginScreen())
  });
  // SharedPreferences _pref = await SharedPreferences.getInstance();
  // if (PreferenceUtil(_pref).getValue(StorageKeys.PROVIDER, '') != '' &&
  //     PreferenceUtil(_pref).getValue(StorageKeys.PROVIDER, '') ==
  //         Provider.GOOGLE.name) {
  //
  // }
}
