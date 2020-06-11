import 'package:flutter/material.dart';
//void main (){
//  runApp(MaterialApp(
//    home: ReportFilterDate(),
//  ));
//}

class ReportFilterStore extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReportFilterStoreState();
  }
}

class ReportFilterStoreState extends State<ReportFilterStore>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "Chọn "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "cửa "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "hàng "),
                ]
            )
        ),
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}