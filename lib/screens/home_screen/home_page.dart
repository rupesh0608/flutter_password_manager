import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState()=> _HomePage();

}


class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: Text("Home Page"),
    );
  }

}