

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passioemployee/model/getAPI_attendance.dart';
import 'package:passioemployee/model/url/url_color.dart';
import 'package:passioemployee/model/url/url_icon.dart';
import 'package:passioemployee/presenter/presenter_calendar.dart';
import 'package:passioemployee/view/people_page.dart';

import 'about.dart';
import 'attendance.dart';
import 'home.dart';

class Calendar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalendarState();
  }
}

class CalendarState extends State<Calendar>{
  int _selectedPage = 3;
  final _pageOptions = [ // Thay Text bằng class để Na
    Home(),
    People(),
    Attendance(),
    Calendar(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    String value;
    GetAPI getAPI = GetAPI();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_main,
        leading: icon_appbar_calendar,
        title: Text("Lịch", style: TextStyle(color: Colors.black),),
      ),
      
     body: ListView(
       children: [
//         container_Calendar(Colors.orangeAccent, "Văn Thanh", "9", "Deliveries"),
//         container_Calendar(Colors.lightGreenAccent ,"Thanh Tú", "9", "Cashier"),
//         container_Calendar(Colors.red, "Văn Toàn", "9", "Accounts"),
       Padding(
         padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
         child: Text("Late", style: TextStyle(
           fontWeight: FontWeight.w600,
           color: Colors.blue,
           fontSize: 20,
         ),),
       ),
             container_Calendar(Colors.red, "Văn Toản", "9", "Accounts", false, "VT"),
             container_Calendar(Colors.red, "Văn Toàn", "9", "Accounts", false, "VT"),
         Padding(
           padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
           child: Text("On shift", style: TextStyle(
             fontWeight: FontWeight.w600,
             color: Colors.blue,
             fontSize: 20,
           ),),
         ),
         container_Calendar(Colors.lightGreenAccent, "Văn Thanh", "9", "Deliveries", true, "VT"),
         container_Calendar(Colors.lightGreenAccent ,"Thanh Tùng", "9", "Cashier", true, "TT"),
         container_Calendar(Colors.lightGreenAccent ,"Trần Dần", "8", "Cashier", true, "TD"),
         container_Calendar(Colors.lightGreenAccent ,"Trần Trung", "9", "Deliveries", true, "TT"),
         container_Calendar(Colors.lightGreenAccent ,"Cao Bá", "9", "Deliveries", true, "CB"),
       ],
     ),

     bottomNavigationBar: BottomNavigationBar(
       fixedColor: choose_bottombar,
       currentIndex: 3,
       onTap: (int index) {
         setState(() {
           if(index != 3) {
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
             icon: Icon(Icons.people, color: icon_bottombar), title: Text("People")),
         BottomNavigationBarItem(
             icon: Icon(Icons.check_circle, color: icon_bottombar), title: Text("Điểm danh")),
         BottomNavigationBarItem(
             backgroundColor: color_bottombar,
             icon: Icon(Icons.assignment, color: icon_bottombar), title: Text("Lịch")),
         BottomNavigationBarItem(
             icon: Icon(Icons.account_circle, color: icon_bottombar), title: Text("Cá nhân")),
       ],
     ),
    );
  }

}