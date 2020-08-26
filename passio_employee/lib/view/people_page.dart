import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passioemployee/model/url/url_color.dart';
import 'package:passioemployee/model/url/url_icon.dart';

import 'about.dart';
import 'attendance.dart';
import 'calendar.dart';
import 'home.dart';

class People extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return PeopleState();
  }

}

class PeopleState extends State{

  static String token;
  int _selectedPage = 1;
  final _pageOptions = [ // Thay Text bằng class để Na
    Home(),
    People(),
    Attendance(),
    Calendar(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_main,
        leading: icon_appbar_people,
        title: Text("People", style: TextStyle(color: Colors.black),),
      ),


      bottomNavigationBar: BottomNavigationBar(
//       fixedColor: Color.fromARGB(255, 168,206,60),\
        fixedColor: choose_bottombar,
        currentIndex: 1,
        onTap: (int index) {
          setState(() {
            if(index != 1) {
              _selectedPage = index;
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => _pageOptions[_selectedPage]),
                      (route) => false);
            }});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: icon_bottombar), title: Text("Home")),
          BottomNavigationBarItem(
              backgroundColor: color_bottombar,
              icon: Icon(Icons.people, color: icon_bottombar), title: Text("People")),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle, color: icon_bottombar), title: Text("Điểm danh")),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment, color: icon_bottombar), title: Text("Lịch")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: icon_bottombar), title: Text("Cá nhân")),
        ],
      ),
    );
  }

}