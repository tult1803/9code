import 'package:flutter/material.dart';
import 'package:passiomanager/PieChart/chart_overview.dart';

import 'chart_overview.dart';


void main(){
  PieChartState.value_store = 50;
  PieChartState.value_deli = 30;
  PieChartState.value_take = 20;
  PieChartState.store = "5.999.650 đ";
  PieChartState.address = "Passio Xô Viết Nghệ Tĩnh \n Chủ Nhật 12/08/2018";
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      color: Color.fromRGBO(227, 229, 233, 1),
      child: PieChart(),
  )));
}

class Revenue extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RevenueState();
  }
}

class RevenueState extends State<Revenue>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 241,243,246),
      child: PieChart(),
    );
  }
}