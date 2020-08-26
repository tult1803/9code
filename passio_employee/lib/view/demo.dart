//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:passioemployee/model/getAPI_attendance.dart';
//import 'package:passioemployee/model/model_attendance.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//class Todo extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return TodoState();
//  }
//
//}
//String token;
//
//class TodoList extends StatelessWidget{
//  final List<AttendanceAPI> data;
//
//  const TodoList({Key key, this.data}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//        itemBuilder: (context, index) {
//          return GestureDetector(
//            child: Container(
//              padding: EdgeInsets.all(10),
//              color: index % 2 == 0 ? Colors.green : Colors.teal,
//              child: Column(
//                children: [
//                  Text(data[index].employee_id),
//                ],
//              ),
//            ),
//          );
//        },
//    );
//  }
//
//
//}
//class TodoState extends State{
//  GetAPI getAPI = GetAPI();
//  @override
//  void initState() {
//    // TODO: implement initState
//    getAttendance();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("API Demo"),
//      ),
//      body: Container(
//        child: FutureBuilder(
//            future: getAPI.getAttendance(token),
//            builder: (context, snapshot){
//            if(snapshot.hasError){
//              print(snapshot.error);
//            }
//            print("TToken: $token");
//            return snapshot.hasData ? TodoList(data: snapshot.data):Center(child: CircularProgressIndicator(),);
//            }
//        ),
//      ),
//    );
//  }
//
//  void getAttendance() async{
//    final prefs = await SharedPreferences.getInstance();
//    setState(() {
//      token =  prefs.getString('token');
//      print(token);
//    });
//  }
//
//}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passioemployee/model/getAPI_attendance.dart';
import 'package:passioemployee/model/model_attendance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:passioemployee/presenter/presenter_attendace.dart';

import 'calendar.dart';
import 'home.dart';
import 'about.dart';
class Attendance1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AttendanceState1();
  }
}
var qrcode;
class AttendanceState1 extends State<Attendance1>{
  int _selectedPage = 1;
  String value;
  final _pageOptions = [ // Thay Text bằng class để Na
    Home(),
    Attendance1(),
    Calendar(),
    Profile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    getAttendance();
  }

  void getAttendance() async{
    final prefs = await SharedPreferences.getInstance();
    GetAPI getAPI = GetAPI();
     setState(() async{
       token = await prefs.getString('token');
       data_list = await getAPI.getAttendance(token);
     });
  }
  String token;
  List<AttendanceAPI> data_list;
  @override
  Widget build(BuildContext context) {
    GetAPI getAPI = GetAPI();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 168,206,60),
        title: Text("Điểm danh"),
      ),
      body: FutureBuilder(
          future: getAPI.getAttendance(token),
        builder: (context, snapshot) {
           if(snapshot.hasError){
              print(snapshot.error);
            }
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: data_list.length,
              itemBuilder: (context, index) {
                String check;
                Color color;
                if(data_list[index].status == 0){
                  color = Colors.orangeAccent;
                  check = "Processing";
                }else
                if(data_list[index].status == 1){
                  color = Color.fromARGB(255, 168,206,60);
                  check = "Present";
                }else if(data_list[index].status == 4){
                  color = Colors.black45;
                  check = "Draft";
                } else if(data_list[index].status == 6){
                  color = Colors.red;
                  check = "Absent";
                }
                return GestureDetector(
                  child: container_attendance(color,Colors.white70, data_list[index].store_name, data_list[index].shift_min.substring(0, 10), check),
                );
              },
            );
          }else {
           return Center(child: CircularProgressIndicator());
          }

        } ),



      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightGreenAccent,
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
              icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 168,206,60),
              icon: Icon(Icons.check_circle), title: Text("Điểm danh")),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), title: Text("Lịch")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Cá nhân")),
        ],
      ),
    );
  }
}