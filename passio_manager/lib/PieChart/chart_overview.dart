

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passiomanager/BottomBar/Overview/overview/overview/overview_page.dart';
import 'package:passiomanager/Filter/Filter_Report.dart';
import 'package:passiomanager/loginpage/login_screen.dart';

//double value;
 class PieChart extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PieChartState();
  }
}

class PieChartState extends State<PieChart> {
  List<charts.Series<Task, String>> seriesPieData;
  static double value_deli = 30.3333;
  static  double value_take = 30.3333;
  static  double value_store = 30.3333;
  static  double price_store = 303030;
  static  double price_take = 99999;
  static  double price_deli = 88888;
  static var store, date, total, address;



  generateData() {


    var piedata = [
      new Task('Store', value_store, Color.fromARGB(255, 247, 198, 94)),
      new Task('Delivery', value_deli, Color.fromARGB(255, 219, 93, 82)),
      new Task('Take Away', value_take, Color.fromARGB(255, 74, 144, 226)),
    ];

    seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }
  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.subdirectory_arrow_right),
          title: Text('Sun'),
        ),
        ListTile(
          title: Text('Moon'),
        ),
        ListTile(
          title: Text('Star'),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesPieData = List<charts.Series<Task, String>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return   new Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => OverviewPage()),
            );
          },
        ),

        title: Text("Doanh thu thực tế",style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterReport()));
                },

                //padding: EdgeInsets.all(0.0),
                child: Image.asset('assets/images/filter.png')),
//            FlatButton(
//                onPressed: null,
//                //padding: EdgeInsets.all(0.0),
//                child: Image.asset('assets/images/share.png'))
          ]





      ),

    body:
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right:80.0, left: 80.0),
                            child: Container(
                              child: charts.PieChart(
                                  seriesPieData,
                                  animate: false,
                                  defaultRenderer: new charts.ArcRendererConfig(arcWidth: 44)),
                            ),),
                          ),
                          Container(
                            //color: const Color(0xff363e2e),
                            width: size.width ,
                            height: size.height * 0.07,
                            child: Text(
                                "$store",
                            style: const TextStyle(
                            color:  const Color(0xff363e2e),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Muli-ExtraBold",
                              fontStyle:  FontStyle.normal,
                              fontSize: 25.0
                          ),
                             textAlign: TextAlign.center
                            )
                          ),
                          Container(
                              //color: const Color(0xff363e2e),
                              width: size.width ,
                              height: size.height * 0.1,
                              child: Text(
                                  "$address",
                                  style: const TextStyle(
                                      color:  const Color(0xff363e2e),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Muli",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.0
                                  ),
                                  textAlign: TextAlign.center
                              )
                          ),

                          Container(
                              child: ListView(children: <Widget>[
                                ListTile(title: Text("Tại cửa hàng"),
                                leading: Icon(Icons.grade,color: Colors.red),
                                trailing: Text("6.380.000đ"),),
                                ListTile(title: Text("Tại cửa hàng"),
                                  leading: Icon(Icons.grade,color: Colors.yellow,),
                                  trailing: Text("6.380.000đ"),),
                                ListTile(title: Text("Tại cửa hàng"),
                                  leading: Icon(Icons.grade,color: Colors.blue),
                                  trailing: Text("6.380.000đ"),)
                              ],),


                              width: size.width * 0.9 ,
//                              height: size.height * 0.2,
                              height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4)
                                    ),
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0,-1),
                                        blurRadius: 0,
                                        spreadRadius: 0
                                    )] ,
                                    color: Colors.white
                                )

                          ),
                          Container(
                            //padding: const EdgeInsets.only(top: 28.0),
                            padding: EdgeInsets.symmetric(vertical: 40.0),
                            width: 320,
                            height: 130,


                            child: RaisedButton(

                              elevation: 15.0,
                              onPressed: () {
                                print('Report Button Pressed');
//                                Navigator.of(context).pushAndRemoveUntil(
//                                    MaterialPageRoute(builder: (context) => OverviewPage()),
//                                        (route) => false);
                              },
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                              ),
                              color: Color.fromRGBO(166, 206, 57, 4),
                              child: Text(
                                'Xem Báo Cáo Chi Tiết ',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.25,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),

    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Value {

}