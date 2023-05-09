import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/screens/login_screen.dart';

import '../utils/common_util.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<StatefulWidget> createState() => _signup();
}

class _signup extends State<Signup> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBgFFFFFF,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorConstant.color667085),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ColorConstant.colorBgFFFFFF,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sign up",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 28)),
            const SizedBox(
              height: 20,
            ),
            const Text("First Name",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter First Name.'),
            ),
            const SizedBox(height: 18),
            const Text("Last Name",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Last Name.'),
            ),
            const SizedBox(height: 18),
            const Text("E-mail",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: ImageIcon(
                    const AssetImage(IconConstant.icMail),
                    color: ColorConstant.color312E49,
                    size: 16,
                  ),
                  hintText: 'Enter your Email'),
            ),
            const SizedBox(height: 18),
            const Text("Password",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              obscureText: passwordVisible,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: ImageIcon(
                    const AssetImage(IconConstant.icLock),
                    color: ColorConstant.color312E49,
                    size: 16,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorConstant.color747980),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  hintText: 'Enter your password.'),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 17),
            RichText(
              text: TextSpan(
                text: "By signing up you agree to our ",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    color: ColorConstant.color747980,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: "Terms & Condition ",
                    style: TextStyle(
                        fontFamily: FontsFamily.gilroyNormal,
                        color: ColorConstant.color312E49,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                        fontFamily: FontsFamily.gilroyNormal,
                        color: ColorConstant.color747980,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(
                        fontFamily: FontsFamily.gilroyNormal,
                        color: ColorConstant.color312E49,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                        fontFamily: FontsFamily.gilroyNormal,
                        color: ColorConstant.color2805FF,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 68,
            ),
            SizedBox(
              height: 43,
              child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.colorB4AAF2,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // <-- Radius
                    ),
                  ),
                  child: Text("Continue",
                      style: TextStyle(
                          fontFamily: FontsFamily.gilroyNormal,
                          color: ColorConstant.colorBgFFFFFF,
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 70),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Already signed up ? ",
                  style: TextStyle(
                      fontFamily: FontsFamily.gilroyNormal,
                      color: ColorConstant.color747980,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                            fontFamily: FontsFamily.gilroyNormal,
                            color: ColorConstant.color2805FF,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.pop(context),
                                Util.navigateTo(context, const LoginScreen())
                              }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ))),
    );
  }
}
