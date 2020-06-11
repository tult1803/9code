import 'package:flutter/material.dart';
//void main (){
//  runApp(MaterialApp(
//    home: ReportFilterDate(),
//  ));
//}

String default_choice = "Sản phẩm";
int default_index = 0;

class ReportFilterProduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReportFilterProductState();
  }
}

class ReportFilterProductState extends State<ReportFilterProduct>{
  String _selectedItem = '';
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
                      text: "Chọn "),
                  TextSpan(
                      style: const TextStyle(
                          color:  Color.fromARGB(255, 54, 62, 46),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Muli",
                          fontStyle:  FontStyle.normal,
                          fontSize: 20.0
                      ),
                      text: "loại "),
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
                    if(default_choice.toLowerCase().trim() == "nhóm sản phẩm"){
                      _onButtonPressed();
                    }else {
                      Navigator.pop(context, default_choice);
                     default_index = 0;
                     default_choice = "Sản phẩm";
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

  void _onButtonPressed() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: 150,
            height: 5,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        ListTile(
          title: Text('Coffee'),
          onTap: () {
            setState(() {
              default_choice = "Coffee";
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          title: Text('Tea & Soda'),
          onTap: () {
            setState(() {
              default_choice = "Tea & Soda";
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          title: Text('Ice blended'),
          onTap: () {
            setState(() {
              default_choice = "Ice blended";
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          title: Text('Fruit chiller'),
          onTap: () {
            setState(() {
              default_choice = "Fruit chiller";
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          title: Text('Special drink'),
          onTap: () {
            setState(() {
              default_choice = "Special drink";
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }}

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
    MyChoice(index:0, choice:"Sản phẩm"),
    MyChoice(index:1, choice:"Nhóm sản phẩm"),
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