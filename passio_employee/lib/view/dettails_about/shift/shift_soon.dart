
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passioemployee/model/url/url_color.dart';

class ShiftSoon extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ShiftSoonState();
  }
}

class ShiftSoonState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color_main,
        title: Text("Ca sắp tới", style: TextStyle(color: Colors.black)),
        leading: IconButton(icon: Icon(Icons.chevron_left, size: 30, color: Colors.black,), onPressed: () => Navigator.pop(context), ) ,
      ),
    );
  }

}