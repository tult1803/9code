import 'dart:ffi';

import 'package:flutter/material.dart';


final valuestopopulate = {
  1: "Tea Break",
  2: "Projector",
  3: "Mentor & Support",
  4: "Help & Feedback",
  5: "Setting",
};

void getvaluefromkey(Set selection) {
  if (selection != null) {
    for (int x in selection.toList()) {
      print(valuestopopulate[x]);
    }
  }
}



Widget txtNote(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: text,
      ),
    ),
  );
}

Widget buttonSubmit(Size size) {
  return Container(
    width: size.width,
    color: Color.fromARGB(255, 243, 117, 1),
    height: 50,
    child: FlatButton(
        onPressed: () {},
        child: Container(
            alignment: Alignment.center,
            width: size.width,
            child: btn_text("Submit", 15.0))),
  );
}

Widget btnDetail(String text1, String text2) {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          color: Colors.redAccent,
          height: 40,
          child: FlatButton(onPressed: () {}, child: btn_text(text1, 15.0)),
        ),
        Expanded(child: SizedBox()),
        Container(
          height: 40,
          color: Colors.green,
          child: FlatButton(onPressed: () {}, child: btn_text(text2, 15.0)),
        ),
      ],
    ),
  );
}


Widget iconService(Icon icon) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
    child: Container(
      //     color: Colors.grey,
      child: icon,
//           height: 50,width: 50,
    ),
  );
}


Widget text(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget textTittle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget textArea(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
    ),
  );
}

Widget subtext(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13,
      ),
    ),
  );
}

Widget bookedtext(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.blueAccent,
        fontSize: 13,
      ),
    ),
  );
}

Widget statustext(Color color, String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 13,
      ),
    ),
  );
}

Widget btn_text(String text, double size) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: size,
      ),
    ),
  );
}




Widget Check_text(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    ),
  );
}
