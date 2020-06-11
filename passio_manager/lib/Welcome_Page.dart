import 'dart:async';
import 'package:flutter/material.dart';
import 'package:passiomanager/loginpage/login_screen.dart';

//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//    home: Demo(),
//  ));
//}
class Demo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}
Timer timer;
int count = 0;
class DemoState extends State<Demo> with WidgetsBindingObserver{

  @override
  void initState() {
      timer = Timer.periodic(Duration(seconds: 3), (time) {
        if(count == 0) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            count = 1;
        }});
    }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/img_bg.png"))
      ),
      child: Image.asset("images/app_icon.png"),
    );
  }
}
