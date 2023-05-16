import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:password_manager/view/login_screen.dart';

import '../../constant/constant.dart';
import '../../data/model/login_model.dart';
import '../../utils/firebase_auth_util.dart';
import '../home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final _storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ClipOval(
            //     child: Image(
            //   fit: BoxFit.cover,
            //   image: NetworkImage(
            //       "https://ui-avatars.com/api/?name=${currentUser()!.displayName?.replaceAll(" ", "+") ?? ''}"),
            // )),
            Text(
                "NAME: ${loginData().data?.firstName} ${loginData().data?.lastName}"),
            Text("EMAIL: ${loginData().data?.email}"),
            /*
            Text("PHONE NUMBER: ${currentUser()!.phoneNumber!}"),
            Text("UID: ${currentUser()!.uid}"),*/
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      logout();
                      // logout(context);
                    },
                    child: const Text("Logout")))
          ],
        ),
      ),
    );
  }

  LoginModel loginData() {
    return LoginModel.fromJson(_storage.read(Field.FIELD_LOGIN));
  }

  logout() {
    _storage.erase();
    Get.offAll(const LoginScreen());
  }
}
