import 'dart:ffi';

import 'package:flutter/material.dart';
import 'room_details.dart';

import 'add_services_persenter.dart';

final valuestopopulate = {
  1: "Tea Break",
  2: "Projector",
  3: "Mentor & Support",
  4: "Help & Feedback",
  5: "Setting",
};

void populateMultiselect() {
  for (int v in valuestopopulate.keys) {
    multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
  }
}

void getvaluefromkey(Set selection) {
  if (selection != null) {
    for (int x in selection.toList()) {
      print(valuestopopulate[x]);
    }
  }
}

void showMultiSelect(BuildContext context) async {
  multiItem = [];
  populateMultiselect();
  final items = multiItem;
  // final items = <MultiSelectDialogItem<int>>[
  //   MultiSelectDialogItem(1, 'India'),
  //   MultiSelectDialogItem(2, 'USA'),
  //   MultiSelectDialogItem(3, 'Canada'),
  // ];

  final selectedValues = await showDialog<Set<int>>(
    context: context,
    builder: (BuildContext context) {
      return MultiSelectDialog(
        items: items,
//          initialSelectedValues: [null].toSet(),
      );
    },
  );

  print(selectedValues);
  getvaluefromkey(selectedValues);
}

Widget attachedService(BuildContext context, Size size) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Container(
      width: size.width,
      child: FlatButton(
          onPressed: () async {
            await showMultiSelect(context);
          },
          child: Text("- Choose to add more services -")),
    ),
  );
}

Widget txtUsing() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Leave blank or input an FPT email',
      ),
      onChanged: (value) {
        // setState(() {
        num_people = int.parse(value);
        // });
      },
    ),
  );
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
      onChanged: (value) {
        // setState(() {
        num_people = int.parse(value);
        // });
      },
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

Widget txtNumPeople() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        // setState(() {
        num_people = int.parse(value);
        // });
      },
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

Widget info() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text("Description"),
      subtext(description),
      text("Location"),
      subtext("$location - $block - $area - $floor"),
      text("Department"),
      subtext(department),
      Row(
        children: [text("Area: "), textArea(area)],
      )
    ],
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

Widget changeRoom(BuildContext context, String room) {
  return FlatButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  content: Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: textTittle("CHANGE ROOM")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: text("Current room"),
                    ),
                    subtext(room),
                    text("Change to"),
                    Container(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), // Viền cho textfield
                          hintText: 'Input room',
                        ),
                        onChanged: (value) {
                          // setState(() {
                          room_name = value;
                          // });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: btnDetail("Cancel", "Update"),
                    ),
                  ],
                ),
              ));
            });
      },
      child: subtext("change"));
}

Widget infoCheck() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text("Description"),
      subtext(description),
      text("Location"),
      subtext("$location - $block - $area - $floor"),
      text("Department"),
      subtext(department),
      Row(
        children: [text("Area: "), textArea(area)],
      ),
      text("Resources"),
      subtext(resource),
    ],
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
