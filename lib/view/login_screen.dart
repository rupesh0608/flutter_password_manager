import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/data/enum/Provider.dart';
import 'package:password_manager/data/enum/storage_keys.dart';
import 'package:password_manager/data/model/login_model.dart';
import 'package:password_manager/utils/app_util.dart';
import 'package:password_manager/utils/common_util.dart';
import 'package:password_manager/utils/firebase_auth_util.dart';
import 'package:password_manager/utils/util_extensions.dart';
import 'package:password_manager/view/signup_screen.dart';
import 'package:password_manager/view_model/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utility.dart';
import 'Common/common_widgets.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _storage = GetStorage();
  AuthController authController = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool _passwordVisible = false;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.colorBgFFFFFF,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: ColorConstant.colorBgFFFFFF,
              elevation: 0,
            ),
            const Text("Login",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 28)),
            const SizedBox(
              height: 36,
            ),
            const Text("E-mail",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            editTextField("Email id".tr, emailController, false, "", false),
            18.verticalSpace(),
            const Text("Password",
                style: TextStyle(
                    fontFamily: FontsFamily.gilroyNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            6.verticalSpace(),
            editTextField(
                "Password".tr, passWordController, true, "", _passwordVisible,
                onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
            const SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //SizedBox
                SizedBox(
                  width: 18,
                  height: 18,
                  child: Checkbox(
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                ),
                Text("  Remember me",
                    style: TextStyle(
                        fontFamily: FontsFamily.gilroyNormal,
                        color: ColorConstant.color747980,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const Expanded(child: SizedBox()),
                Text("Forgot Password?",
                    style: TextStyle(
                        fontFamily: FontsFamily.gilroyNormal,
                        color: ColorConstant.color2805FF,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)) //Checkbox
              ], //<Widget>[]
            ),
            64.verticalSpace(),
            SizedBox(
              height: 43,
              child: ElevatedButton(
                  onPressed: () => login(),
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
            const SizedBox(height: 60),
            SizedBox(
              height: 20,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(color: ColorConstant.colorCDCED1),
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text("or continue with",
                          style: TextStyle(
                              fontFamily: FontsFamily.gilroyNormal,
                              color: ColorConstant.color747980,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(color: ColorConstant.colorCDCED1),
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    googleSignIn(context, onDataReceived: (result) {
                      saveUserDetails(result);
                      const HomeScreen().navigate();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstant.colorEBE9F1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: const Image(
                      width: 68,
                      height: 68,
                      image: AssetImage(IconConstant.icGoogle),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstant.colorEBE9F1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: const Image(
                      width: 68,
                      height: 68,
                      image: AssetImage(IconConstant.icFb),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstant.colorEBE9F1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: const Image(
                      width: 68,
                      height: 68,
                      image: AssetImage(IconConstant.icLinkedin),
                    )),
              ],
            ),
            SizedBox(height: getScreenHeight(context) / 8),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don,t have an account? ",
                  style: TextStyle(
                      fontFamily: FontsFamily.gilroyNormal,
                      color: ColorConstant.color747980,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Signup",
                      style: TextStyle(
                          fontFamily: FontsFamily.gilroyNormal,
                          color: ColorConstant.color2805FF,
                          fontSize: 12,
                          fontWeight: FontWeight.w800),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => const Signup().navigate(),
                    )
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

  login() async {
    if (emailController.text.isEmpty) {
      "Please enter your email id/username".tr.toast();
    } else if (passWordController.text.isEmpty) {
      "Please enter your password".tr.toast();
    } else {
      launchProgress();
      var res = await authController.login(
          emailController.text.trim(), passWordController.text.trim());
      disposeProgress();
      if (res.error!) {
        res.message?.trim().tr.toast();
      } else {
        emailController.clear();
        passWordController.clear();
        res.message?.trim().tr.toast();
        _storage.write(Field.FIELD_LOGIN, res.toJson());
        Get.offAll(const HomeScreen());
      }
    }
  }
}

saveUserDetails(UserCredential result) async {
  User? user = result.user;
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString(StorageKeys.EMAIL.name, user?.email ?? '');
  pref.setString(StorageKeys.USER_NAME.name, user?.displayName ?? '');
  pref.setString(StorageKeys.UID.name, user?.uid ?? '');
  pref.setString(StorageKeys.PIC_URL.name, user?.photoURL ?? '');
  pref.setString(StorageKeys.PROVIDER.name, Provider.GOOGLE.name);
}

checkForUserLoggedIn(context) async {
  if (isUserLoggedIn()) {
    Util.navigateAndReplace(context as BuildContext, const HomeScreen());
  } else {
    SharedPreferences pref = await SharedPreferences.getInstance();
    googleSignOut(() => {pref.clear()});
  }
}
