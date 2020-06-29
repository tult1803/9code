import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_services_persenter.dart';
import 'room_detail_presenter.dart';
import 'package:intl/intl.dart';

class RequestDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestDetailsState();
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
    purpose = "Class meeting",
    note =
        "Health officials testified to Congress about the government’s pandemic response.  Swimming will be allowed at New York City beaches starting on July 1.",
    booked_by = "abc123@fpt.edu.vn",
    fstarttime = DateFormat('HH:mm:ss').format(startTime).toString(),
    fendtime = DateFormat('HH:mm:ss').format(endTime).toString();
DateTime startTime = DateTime.now();
DateTime endTime = DateTime.now();

class RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 117, 1),
        title: Text("Request Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              children: [
                Container(
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
                          text("Room"),
                          Row(
                            children: <Widget>[
                              textArea(room_name),
                              changeRoom(context, room_name),
                            ],
                          ),
                          text("Status"),
                          statustext(Colors.green, status),
                          text("Time"),
                          subtext(fstarttime + " - " + fendtime),
                          text("Number of people"),
                          subtext(maximum_capacity),
                          text("Purpose of using"),
                          subtext(purpose),
                          text("Attached Services"),
                          Wrap(
                            children: <Widget>[
                              iconService(Icon(Icons.local_drink)),
                              iconService(Icon(Icons.videocam)),
                              iconService(Icon(Icons.help)),
                              iconService(Icon(Icons.wifi)),
                              iconService(Icon(Icons.wc)),
                            ],
                          ),
                          text("Booked by"),
                          bookedtext(booked_by),
                          text("Using person"),
                          bookedtext(booked_by),
                          text("Note"),
                          subtext(note),
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
                              child: textTittle("APPROVAL SECTION"),
                            ),
                            text("Message"),
                            txtNote('Tell them what happened'),
                            btnDetail("DENIED", "APPROVE"),
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
}
