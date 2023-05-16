import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/utils/util_extensions.dart';
import 'package:password_manager/view/home_screen.dart';
import 'package:password_manager/view/login_screen.dart';

import '../utils/common_util.dart';
import '../utils/utility.dart';
import '../view_model/auth_controller.dart';
import 'Common/common_widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<StatefulWidget> createState() => _signup();
}

class _signup extends State<Signup> {
  AuthController authController = Get.find();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool _passwordVisible = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBgFFFFFF,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorConstant.color667085),
          onPressed: () =>Get.back(),
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
            editTextField(
                "First Name".tr, firstNameController, false, "", false),
            const SizedBox(height: 18),
            const Text("Last Name",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            editTextField("Last Name".tr, lastNameController, false, "", false),
            const SizedBox(height: 18),
            const Text("E-mail",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            editTextField("Email id".tr, emailController, false, "", false),
            const SizedBox(height: 18),
            const Text("Password",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            editTextField(
                "Password".tr, passWordController, true, "", _passwordVisible,
                onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
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
                  onPressed: () => register(),
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

  register() async {
    if (firstNameController.text.isEmpty) {
      "Please enter your FirstName".tr.toast();
    } else if (lastNameController.text.isEmpty) {
      "Please enter LastName".tr.toast();
    } else if (!emailController.text.isEmail) {
      "Please enter valid email address".tr.toast();
    } else if (passWordController.text.isEmpty) {
      "Please enter Password".tr.toast();
    } else {
      launchProgress();
      var res = await authController.register(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          emailController.text.trim(),
          passWordController.text.trim(),
          passWordController.text.trim());
      disposeProgress();
      if (!res.error!) {
        clearFields();
        res.message?.trim().tr.toast();
        Get.offAll(const LoginScreen());
      } else {
        res.message?.trim().tr.toast();
      }
    }
  }

  clearFields() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passWordController.clear();
  }
}
