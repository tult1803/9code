

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passioemployee/model/url/url_color.dart';
import 'package:passioemployee/model/url/url_icon.dart';
import 'package:passioemployee/view/people_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about.dart';
import 'attendance.dart';
import 'calendar.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{
   static String token;
  int _selectedPage = 0;
  final _pageOptions = [ // Thay Text bằng class để Naviga
    Home(),
    People(),
    Attendance(),
    Calendar(),
    Profile(),
  ];

  @override
  void initState() {
    _getToken();
  }

  void _getToken()async{
    final prefs = await SharedPreferences.getInstance();
    setState((){
      token = prefs.getString('token');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_main,
        leading: icon_appbar_home,
        title: Text("Home", style: TextStyle(color: Colors.black),),
//        shape: ,
      ),
      body: Center(
        child: Column(
          children: [
            Container(

            ),
          ],
        ),
      ),


     bottomNavigationBar: BottomNavigationBar(
//       fixedColor: Color.fromARGB(255, 168,206,60),\
     fixedColor: choose_bottombar,
       currentIndex: 0,
       onTap: (int index) {
         setState(() {
           if(index != 0) {
             _selectedPage = index;
             Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context) => _pageOptions[_selectedPage]),
                     (route) => false);
           }});
       },
       items: [
         BottomNavigationBarItem(
             backgroundColor: color_bottombar,
             icon: Icon(Icons.home, color: icon_bottombar), title: Text("Home")),
         BottomNavigationBarItem(
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