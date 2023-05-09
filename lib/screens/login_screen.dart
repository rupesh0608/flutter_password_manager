import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/screens/home_page.dart';
import 'package:password_manager/screens/signup_screen.dart';
import 'package:password_manager/utils/app_util.dart';
import 'package:password_manager/utils/common_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool passwordVisible = false;

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
            const SizedBox(
              height: 64,
            ),
            SizedBox(
              height: 43,
              child: ElevatedButton(
                  onPressed: () =>Util.navigateAndReplace(context,const HomeScreen()),
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
                Container(
                  decoration:BoxDecoration(
                      border: Border.all(color: ColorConstant.colorEBE9F1),
                      borderRadius: const BorderRadius.all(Radius.circular(6))
                  ),

                  child: const Image(
                    width: 68,
                    height: 68,
                    image: AssetImage(IconConstant.icGoogle),
                  ),
                ),
                const SizedBox(width: 24),
                Container(
                  decoration:BoxDecoration(
                      border: Border.all(color: ColorConstant.colorEBE9F1),
                      borderRadius: const BorderRadius.all(Radius.circular(6))
                  ),

                  child:const Image(
                    width: 68,
                    height: 68,
                    image: AssetImage(IconConstant.icFb),
                  )
                ),
                const SizedBox(width: 10,),
                Container(
                    decoration:BoxDecoration(
                        border: Border.all(color: ColorConstant.colorEBE9F1),
                        borderRadius: const BorderRadius.all(Radius.circular(6))
                    ),

                    child:const Image(
                      width: 68,
                      height: 68,
                      image: AssetImage(IconConstant.icLinkedin),
                    )
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(context)/8),
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
                      recognizer:TapGestureRecognizer()..onTap = ()=>Util.navigateTo(context,const Signup())
                    ),
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
