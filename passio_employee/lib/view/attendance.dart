import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:passioemployee/model/getAPI_attendance.dart';
import 'package:passioemployee/model/model_attendance.dart';
import 'package:passioemployee/model/url/url_color.dart';
import 'package:passioemployee/model/url/url_icon.dart';
import 'package:passioemployee/presenter/presenter_attendace.dart';
import 'package:passioemployee/view/people_page.dart';

import 'calendar.dart';
import 'home.dart';
import 'about.dart';
class Attendance extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AttendanceState();
  }
}
var qrcode;
class AttendanceState extends State<Attendance>{
  int _selectedPage = 2;
  String value;
  final _pageOptions = [ // Thay Text bằng class để Na
    Home(),
    People(),
    Attendance(),
    Calendar(),
    Profile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    getAttendance();
  }

  void getAttendance() async{
    GetAPI getAPI = GetAPI();
    setState(() async{
      do {
        data_list = await getAPI.getAttendance(HomeState.token);
      }while(data_list.isEmpty);
    });
  }
  List<AttendanceAPI> data_list = [];
  @override
  Widget build(BuildContext context) {
    GetAPI getAPI = GetAPI();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_main,
        leading: icon_appbar_attendance,
        title: Text("Điểm danh",style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder(
          future:  getAPI.getAttendance(HomeState.token),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              print(snapshot.error);
            }
            if(snapshot.hasData){
              return  new  Column(
                children: [
                   Center(child: Text("QR-Code: $qrcode")),
            Container(
             height: size.height * .2,
             child: Center(
                 child: RaisedButton(
                   color: Color.fromARGB(255, 168,206,60),
                   onPressed: () async{
                     value = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", false, ScanMode.QR);
                     setState(() {
//                       qrcode = await BarCode();
                     qrcode = value;
                     });
                   },
                   child: Container(
                     alignment: Alignment.center,
                     height: 50,
                     width: 100,
                     child: Text("QR-CODE", style: TextStyle(
                       fontWeight: FontWeight.w700,
                       fontSize: 16
                     ),),
                   ),
                 ),
             ),
           ),
                  Expanded(
                    child: ListView.builder(
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
                        }else if(data_list[index].status == 2){
                          color = Color.fromARGB(255, 168,206,60);
                          check = "Reject";
                        }else if(data_list[index].status == 3){
                          color = Color.fromARGB(255, 168,206,60);
                          check = "Employee Submit";
                        }else if(data_list[index].status == 4){
                          color = Colors.black45;
                          check = "Draft";
                        } else if(data_list[index].status == 5){
                          color = Colors.black45;
                          check = "Closed";
                        }else if(data_list[index].status == 6){
                          color = Colors.red;
                          check = "Absent";
                        }
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: container_attendance(color,Colors.white70, data_list[index].store_name, data_list[index].shift_min.substring(0, 10), check),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }else {
              return Center(child: CircularProgressIndicator());
            }

          } ),



      bottomNavigationBar: BottomNavigationBar(
        fixedColor: choose_bottombar,
        currentIndex: 2,
        onTap: (int index) {
          setState(() {
            if(index != 2) {
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
              backgroundColor: color_bottombar,
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