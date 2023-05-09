import 'package:flutter/material.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/screens/splashscreen_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: FontsFamily.gilroyNormal,
          primaryColor: Colors.white,
      ),
      home: const Splashscreen(),
    );
  }
}
