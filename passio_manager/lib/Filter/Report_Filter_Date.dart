import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';
import 'dart:async';

//void main (){
//  runApp(MaterialApp(
//    home: ReportFilterDate(),
//  ));
//}
String default_choice = "Hôm nay";
int default_index = 0;

class ReportFilterDate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReportFilterDateState();
  }
}

class ReportFilterDateState extends State<ReportFilterDate>{
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      text: "Thời "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "gian")
                ]
            )
        ),
      ),
      body: Container(
          color: Color.fromARGB(255, 241,243,246),
//        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Container(
                child: Container(
                  height: size.height * 0.6,
                  margin: EdgeInsets.all(15),
                  color: Colors.white,
                    child: RadioGroup(),
                ),
              ),
            Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.only(bottom: 20),
                width: 312,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(4)
                    ),
                    boxShadow: [BoxShadow(
                        offset: Offset(0,4),
                        blurRadius: 8,
                        spreadRadius: 0,
                    )] ,
                    color: Color.fromARGB(255, 166, 207, 57),
                ),
                child: FlatButton(
                    onPressed: () async{
                          if(check_date(default_choice) == true){
                            await displayDateRangePicker(context);
                           String start = DateFormat('dd/MM/yyyy').format(_startDate).toString();
                           String end = DateFormat('dd/MM/yyyy').format(_endDate).toString();
                           String week = start+"-"+end;
                            Navigator.pop(context, week);
                          }else {
                            Navigator.pop(context, default_choice);
                          }
                    },
                    child: Text(
                    "Xong",
                    style: const TextStyle(
                        color:  Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Muli",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    ),
                    textAlign: TextAlign.center
                )),
            )
          ],
        ),
      ),
    );
  }
}

class MyChoice {
  String choice;
  int index;
  MyChoice({this.index, this.choice});
}

class RadioGroup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  new RadioGroupState();
  }
}

class RadioGroupState extends State<RadioGroup>{
//   default_choice = "Hôm nay";
//   default_index = 0;
  List<MyChoice> choices = [
    MyChoice(index:0, choice:"Hôm nay"),
    MyChoice(index:1, choice:"Hôm qua"),
    MyChoice(index:2, choice:"Tuần này"),
    MyChoice(index:3, choice:"Tuần trước"),
    MyChoice(index:4, choice:"Tháng này"),
    MyChoice(index:5, choice:"Tháng trước"),
    MyChoice(index:6, choice:"Tuỳ chọn ngày"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Container(
              child: Column(
                children: choices.map((data) =>
                    RadioListTile(
                      title: Text("${data.choice}"),
                      value: data.index,
                      groupValue: default_index,
                      onChanged: (value) {
                        setState(() {
                          default_choice = data.choice;
                          default_index = data.index;
                        });
                      },)).toList(),
              ),
            )
          ],
        )

      ],
    );
  }
  }

  bool check_date (String value) {
       if(value == "Tuỳ chọn ngày"){
         return true;
       }else {
         return false;
       }
  }