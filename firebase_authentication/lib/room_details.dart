import 'package:flutter/material.dart';
import 'add_services_persenter.dart';
import 'menu_item.dart';
import 'room_detail_presenter.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailsState();
  }
}

var menu_item = "Menu Item",
    tittle = "BOOKING INFORMATION",
    description = "Xịn xò, Mới, Mát mẻ",
    department = "Student Development Department",
    room_name = "R201",
    room_kind = "Classroom",
    acreage = "20",
    maximum_capacity = "At most 30",
    location = "FPT University ",
    area = "Area A",
    block = "Block 3",
    floor = "Floor 1",
    status = "EMPTY",
    resource = "Projector; Display Screen; Air-conditioner",
    fnowDate = DateFormat('dd/MM/yyyy').format(nowDate).toString(),
    fstarttime = DateFormat('HH:mm:ss').format(startTime).toString(),
    fendtime = DateFormat('HH:mm:ss').format(endTime).toString();
int num_people = 0;
DateTime nowDate = DateTime.now();
DateTime startTime = DateTime.now();
DateTime endTime = DateTime.now();
String value = "";
List<DropdownMenuItem<String>> menuitems = List();
bool disabledropdown = true;
List<MultiSelectDialogItem<int>> multiItem = List();

class DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 117, 1),
        title: Text("Room Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              children: [
                Container(
                  height: 280,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 100,
                                child: Column(children: [
                                  Image.asset(
                                    'assets/images/image 3.png',
                                    height: 65,
                                  ),
                                  Text("$status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.lightGreen))
                                ]),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("$room_name",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text("$room_kind",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 243, 117, 1))),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.layers,
                                                color: Colors.grey,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text("$acreage m2",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: Colors.grey,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text("$maximum_capacity",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Colors.grey)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: info(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
//                      height: 700,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: textTittle(tittle),
                            ),
                            text("Time"),
                            subtext(fstarttime + " - " + fendtime),
                            text("Number of people ($num_people)"),
                            txtNumPeople(),
                            text("Purpose of using"),
                            listPurpose(size),
                            text("Attached Services"),
                            attachedService(context, size),
                            text("Using person"),
                            txtUsing(),
                            text("Note"),
                            txtNote('Need something ?'),
                            buttonSubmit(size),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future displayDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: nowDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(3020));
    if (picked != null) {
      setState(() {
        nowDate = picked;
        fnowDate = DateFormat('dd/MM/yyyy').format(nowDate).toString();
      });
    }
  }

  Widget listPurpose(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        alignment: Alignment.centerLeft,
        width: size.width,
        height: 40,
        child: FlatButton(
          onPressed: () async {
            await showMenu();
          },
          child: Container(width: size.width, child: Text(menu_item)),
        ),
      ),
    );
  }

  Widget showMenu() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Menu Item"),
            content: RadioGroup(),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      menu_item = default_choice;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit"))
            ],
          );
        });
  }
}
//final valuestopopulate = {
//  1 : "Tea Break",
//  2 : "Projector",
//  3 : "Mentor & Support",
//  4 : "Help & Feedback",
//  5 : "Setting",
//};
//
//void populateMultiselect(){
//  for(int v in valuestopopulate.keys){
//    multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
//  }
//}
//
//
//void getvaluefromkey(Set selection){
//  if(selection != null){
//    for(int x in selection.toList()){
//      print(valuestopopulate[x]);
//    }
//  }
//}
//
//void showMultiSelect(BuildContext context) async {
//  multiItem = [];
//  populateMultiselect();
//  final items = multiItem;
//  // final items = <MultiSelectDialogItem<int>>[
//  //   MultiSelectDialogItem(1, 'India'),
//  //   MultiSelectDialogItem(2, 'USA'),
//  //   MultiSelectDialogItem(3, 'Canada'),
//  // ];
//
//  final selectedValues = await showDialog<Set<int>>(
//    context: context,
//    builder: (BuildContext context) {
//      return MultiSelectDialog(
//        items: items,
////          initialSelectedValues: [null].toSet(),
//      );
//    },
//  );
//
//  print(selectedValues);
//  getvaluefromkey(selectedValues);
//}
