import 'package:demofptbooking/room_details.dart';
import 'package:flutter/material.dart';

import 'add_services_persenter.dart';



//  String value = "";
//  List<DropdownMenuItem<String>> menuitems = List();
//  bool disabledropdown = true;
//  List <MultiSelectDialogItem<int>> multiItem = List();


  final valuestopopulate = {
    1 : "Tea Break",
    2 : "Projector",
    3 : "Mentor & Support",
    4 : "Help & Feedback",
    5 : "Setting",
  };

  void populateMultiselect(){
    for(int v in valuestopopulate.keys){
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
    }
  }


  void getvaluefromkey(Set selection){
    if(selection != null){
      for(int x in selection.toList()){
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
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Container(
      width: size.width,
      child: FlatButton(
          onPressed: ()  async {
            await showMultiSelect(context);
          },
          child: Text("- Choose to add more services -")),
    ),
  );
}

  Widget txtUsing(){
    return
      Padding(
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

  Widget txtNote(){
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Need something ?',
          ),
          onChanged: (value) {
            // setState(() {
            num_people = int.parse(value);
            // });
          },
        ),
      );
  }

  Widget buttonSubmit(Size size){
    return Container(
      width: size.width,
      color: Color.fromARGB(255, 243, 117, 1),
      height: 50,
      child: FlatButton(
          onPressed: () {},
          child: Container(alignment: Alignment.center,width: size.width,child: submit_text("Submit"))),
    );
  }

  Widget txtNumPeople(){
    return
      Padding(
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

  Widget info(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text("Description"),
        subtext(description),
        text("Location"),
        subtext("$location - $block - $area - $floor"),
        text("Department"),
        subtext(department),
        Row(children: [text("Area: "),textArea(area)],)
      ],
    );
  }

  Widget text(String text) {
    return Text(text, style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),);
  }
  Widget textTittle(String text) {
    return Text(text, style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),);
  }
  Widget textArea(String text) {
    return Text(text, style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.blue,
    ),);
  }
  Widget subtext(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Text(text, style: TextStyle(
        color: Colors.grey,
        fontSize: 13,
      ),),
    );
  }
  Widget submit_text(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Text(text, style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize:20,
      ),),
    );
  }







