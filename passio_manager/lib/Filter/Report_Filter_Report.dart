import 'package:flutter/material.dart';
//void main (){
//  runApp(MaterialApp(
//    home: ReportFilterDate(),
//  ));
//}

String default_choice = "Sau giảm giá";
int default_index = 0;

class ReportFilterReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReportFilterReportState();
  }
}

class ReportFilterReportState extends State<ReportFilterReport>{
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
                      text: "Xem "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "báo "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "cáo ")
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
                height: size.height * 0.18,
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
                      Navigator.pop(context, default_choice);
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
    MyChoice(index:0, choice:"Sau giảm giá"),
    MyChoice(index:1, choice:"Trước giảm giá"),
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