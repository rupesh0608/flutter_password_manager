import 'dart:async';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/data/enum/Provider.dart';
import 'package:password_manager/data/enum/storage_keys.dart';
import 'package:password_manager/data/shared_preference.dart';
import 'package:password_manager/screens/home_screen/password_page.dart';
import 'package:password_manager/screens/home_screen/profile_page.dart';
import 'package:password_manager/screens/login_screen.dart';
import 'package:password_manager/screens/signup_screen.dart';
import 'package:password_manager/utils/app_util.dart';
import 'package:password_manager/utils/firebase_auth_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/common_util.dart';
import 'home_screen/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  static  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const PasswordPage(),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBgFFFFFF,
      appBar: AppBar(
        backgroundColor: ColorConstant.colorBgFFFFFF,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstant.colorBgFFFFFF,
          items:  <BottomNavigationBarItem>[
            bottomItem(IconConstant.icHome,'Home'),
            bottomItem(IconConstant.icPassword,'Password'),
            bottomItem(IconConstant.icProfile,'Profile'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex:_selectedIndex,
          selectedItemColor: ColorConstant.colorBg9046CF,
          unselectedItemColor: ColorConstant.colorBg9046CF.withOpacity(0.4),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 20
      ),
    );
  }
}

bottomItem(String icon,String label){
  return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(icon),
        size: 40,
      ),
      label:label
  );
}

logout(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
  googleSignOut(() => {
        if (context.mounted)
          Util.clearStackAndNavigateTo(context, const LoginScreen())
      });
}
