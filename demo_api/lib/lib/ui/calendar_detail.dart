

import 'package:demoapi/lib/blocs/calendar_detail_bloc.dart';
import 'package:demoapi/lib/models/calendar_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../room_detail_presenter.dart';

class CalendarDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalendarDetailsState();
  }
}

var menu_item = "Menu Item",
    tittle = "BOOKING INFORMATION",
    room_name = "R201",
    room_kind = "Classroom",
    maximum_capacity = "At most 30",
    status = "EMPTY",
    purpose = "Class meeting",
    note =
        "Health officials testified to Congress about the government’s pandemic response.  Swimming will be allowed at New York City beaches starting on July 1.",
    booked_by = "abc123@fpt.edu.vn",
    fstarttime, fendtime;


class CalendarDetailsState extends State<CalendarDetails> {
  CalendarDetailBloc bloc = CalendarDetailBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.loadRoom('1');
  }

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
            child: StreamBuilder(
            stream: bloc.stream, // B2 khai bao stream
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    CalendarDetailModel calendarDetailModel = snapshot.data;
                    DateTime startTime = DateTime.parse(calendarDetailModel.from_time);
                    DateTime endtime = DateTime.parse(calendarDetailModel.to_time);
                    fstarttime = DateFormat('HH:mm:ss').format(startTime).toString();
                    fendtime = DateFormat('HH:mm:ss').format(endtime).toString();
//                      height: 700,
                       return Card(
                         child: Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Center(
                                 child: textTittle(tittle),
                               ),
                               text("Room"),
                               textArea(calendarDetailModel.room.name),
                               text("Status"),
                               statustext(Colors.green, calendarDetailModel.status),
                               text("Time"),
                               subtext(fstarttime + " - " + fendtime),
                               text("Number of people"),
                               subtext('${calendarDetailModel.num_of_people}'),
                               text("Purpose of using"),
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
                               bookedtext(calendarDetailModel.book_person),
                               text("Using person"),
                               bookedtext(calendarDetailModel.using_person),
                               text("Note"),
                               subtext(calendarDetailModel.note),
                               text("Feedback"),
                               txtNote('Is there any problem with the room ?'),
                               btnDetail("ABORT", "SEND FEEDBACK"),
                             ],
                           ),
                         ),
                       );
                   };
                 }),
                      ) ],
            ),
          ),
        ),
      ),
    );
  }
}
