import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'room_detail_presenter.dart';
import 'package:intl/intl.dart';

class CheckDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckDetailsState();
  }
}

var menu_item = "Menu Item",
    tittle = "ROOM CHECKING",
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
    fstarttime = DateFormat('HH:mm:ss').format(startTime).toString(),
    fendtime = DateFormat('HH:mm:ss').format(endTime).toString();
DateTime startTime = DateTime.now();
DateTime endTime = DateTime.now();
bool switch_status = false;

class CheckDetailsState extends State<CheckDetails> {
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
                            child: infoCheck(),
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
                            text("Status"),
                            check_status('Available'),
                            text("Resources"),
                            check_status('Projector'),
                            check_status('Display Screen'),
                            check_status('Air-conditioner'),
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

  Widget check_status(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
//                                  width: 50,
            child: CustomSwitch(
              activeColor: Colors.blueAccent,
              value: switch_status,
              onChanged: (switch_value) {
                setState(() {
                  switch_status = switch_value;
                  print(switch_status);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Check_text(text),
          ),
        ],
      ),
    );
  }
}

// Còn lỗi
