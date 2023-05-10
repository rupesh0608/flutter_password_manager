import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/firebase_auth_util.dart';
import '../home_screen.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState()=> _ProfilePage();

}


class _ProfilePage extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
                child: Image(
                  fit: BoxFit.cover,
                  image:NetworkImage("https://ui-avatars.com/api/?name=${currentUser()!.displayName?.replaceAll(" ","+")??''}"),
                )),
            Text("NAME: ${currentUser()!.displayName!}"),
            Text("EMAIL: ${currentUser()!.email!}"),
            Text("PHONE NUMBER: ${currentUser()!.phoneNumber!}"),
            Text("UID: ${currentUser()!.uid}"),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      logout(context);
                    },
                    child: const Text("Logout")))
          ],
        ),
      ),
    );
  }

}