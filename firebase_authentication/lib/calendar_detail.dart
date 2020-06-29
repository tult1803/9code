import 'package:flutter/material.dart';
import 'room_detail_presenter.dart';
import 'package:intl/intl.dart';

class CalendarDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalendarDetailsState();
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

class CalendarDetailsState extends State<CalendarDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 117, 1),
        title: Text("Calendar Detail"),
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
                          textArea(room_name),
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
                          text("Feedback"),
                          txtNote('Is there any problem with the room ?'),
                          btnDetail("ABORT", "SEND FEEDBACK"),
                        ],
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
