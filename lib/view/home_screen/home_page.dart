import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:password_manager/constant/constant.dart';
import 'package:password_manager/data/model/login_model.dart';

import '../../utils/firebase_auth_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _storage=GetStorage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              color: ColorConstant.colorBg9046CF.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstant.colorC4C4C4,
                              width: 0.5,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              // ClipOval(
                              //     child: Image(
                              //   width: 22,
                              //   height: 22,
                              //   fit: BoxFit.cover,
                              //   image: NetworkImage(
                              //       "https://ui-avatars.com/api/?name=${currentUser()!.displayName?.replaceAll(" ", "+") ?? ''}"),
                              // )),
                              const SizedBox(width: 5),
                              Text(
                                "${loginData().data?.firstName} ${loginData().data?.lastName}",
                                style: TextStyle(
                                    fontFamily: FontsFamily.gilroyNormal,
                                    color: ColorConstant.color1A181B,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const ImageIcon(
                        AssetImage(IconConstant.icNotification),
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  searchBoxLayout(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Manage",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: FontsFamily.gilroyNormal,
                              color: ColorConstant.color1A181B.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Your Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: FontsFamily.gilroySemiBold,
                              color: ColorConstant.color1A181B,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      cardItem(
                          imagePath: IconConstant.icSocials,
                          type: 'Socials',
                          passwordCount: 10),
                      const Expanded(child: SizedBox()),
                      cardItem(
                          imagePath: IconConstant.icApps,
                          type: 'Apps',
                          passwordCount: 8),
                      const Expanded(child: SizedBox()),
                      cardItem(
                          imagePath: IconConstant.icWallet,
                          type: 'Wallets',
                          passwordCount: 6)
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            )),
        Container(
            color: ColorConstant.colorBgFFFFFF,
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  const SizedBox(height: 32,),
                  Text("My Passwords",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: FontsFamily.gilroySemiBold,
                          color: ColorConstant.color1A181B,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ]))),
      ],
    ));


  }

  LoginModel loginData(){
    return LoginModel.fromJson(_storage.read(Field.FIELD_LOGIN));
  }
}

searchBoxLayout() {
  return TextFormField(
    decoration: InputDecoration(
        fillColor: ColorConstant.colorC4C4C4.withOpacity(0.2),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        suffixIcon: Icon(
          Icons.search,
          color: ColorConstant.color130F26,
          size: 24,
        ),
        hintText: 'Enter your Email'),
  );
}

cardItem(
    {required String imagePath,
    required String type,
    required int passwordCount}) {
  return Container(
    decoration: BoxDecoration(
        color: ColorConstant.colorBgFFFFFF,
        borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 16, right: 10, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(width: 40, height: 40, image: AssetImage(imagePath)),
          const SizedBox(height: 8),
          Text(type,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: FontsFamily.gilroySemiBold,
                  color: ColorConstant.color1A181B,
                  fontSize: 14,
                  fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text("$passwordCount Passwords",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: FontsFamily.gilroySemiBold,
                  color: ColorConstant.color8F8F8F,
                  fontSize: 12,
                  fontWeight: FontWeight.w400))
        ],
      ),
    ),
  );




}
