import 'package:flutter/material.dart';

 String default_choice = "Hôm nay";
int default_index = 0;

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