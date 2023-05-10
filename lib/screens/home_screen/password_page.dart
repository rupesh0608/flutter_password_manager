import 'package:flutter/cupertino.dart';

class PasswordPage extends StatefulWidget{
  const PasswordPage({super.key});

  @override
  State<StatefulWidget> createState()=> _PasswordPage();

}


class _PasswordPage extends State<PasswordPage>{
  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: Text("Password Page"),
    );
  }

}