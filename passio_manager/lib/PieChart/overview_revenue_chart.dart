import 'package:flutter/material.dart';
import 'package:passiomanager/PieChart/chart_overview.dart';

void main(){
  PieChartState.value_store = 30.3333;
  PieChartState.value_deli = 30.3333;
  PieChartState.value_take = 30.3333;
  PieChartState.store = "ABx";
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      color: Colors.pink,
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