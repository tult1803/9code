import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fptbooking/view/room_details.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingView extends StatefulWidget {
  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  CalendarController _calendarController;
  String _fromTimeStr;
  String _toTimeStr;

  DateTime _fromTime;
  DateTime _toTime;
  DateTime _dateSelected;
  List<String> _listRoomType = [
    'Classroom',
    'Studio',
  ];
  String _selectedRoomType;
  TextEditingController _txtNumOfPeople;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
    _txtNumOfPeople = TextEditingController();
    _fromTimeStr = 'Not set';
    _toTimeStr = 'Not set';
    _fromTime = null;
    _toTime = null;
    _dateSelected = DateTime.now();
    _selectedRoomType = _listRoomType.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        //
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            _calendarController.setCalendarFormat(CalendarFormat.week);
          });
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
//              collapsedHeight: 420,
              pinned: false,
              expandedHeight: 420,
              snap: true,
              floating: true,
              primary: true,
              backgroundColor: CupertinoColors.lightBackgroundGray,
              flexibleSpace: SafeArea(
                minimum: EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Schedule
                      TableCalendar(
                        initialCalendarFormat: CalendarFormat.week,
                        calendarStyle: CalendarStyle(
                          canEventMarkersOverflow: true,
                        ),
                        headerStyle: HeaderStyle(
                          centerHeaderTitle: true,
                          formatButtonShowsNext: false,
                        ),
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        onDaySelected: (day, events) {
                          setState(() {
                            _dateSelected = day;
                          });
                        },
                        calendarController: _calendarController,
                        builders: CalendarBuilders(
                          selectedDayBuilder: (context, date, events) =>
                              Container(
                                  margin: EdgeInsets.all(_deviceWidth * 0.025),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Text(
                                    date.day.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )),
                          todayDayBuilder: (context, date, events) => Container(
                              margin: EdgeInsets.all(_deviceWidth * 0.025),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                      //Time filter label
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Text('Time filter'),
                      ),

                      // Datetime picker field to pick from time and to time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            child: Text(
                              '$_fromTimeStr',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                            ),
                            onPressed: () {
                              DatePicker.showTimePicker(
                                context,
                                theme: DatePickerTheme(
                                  containerHeight: 250.0,
                                ),
                                showTitleActions: true,
                                onConfirm: (time) {
                                  _fromTime = time;
                                  setState(() {
                                    _fromTimeStr =
                                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                                  });
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en,
                                showSecondsColumn: false,
                              );
                            },
                          ),
                          Text('-'),
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              '$_toTimeStr',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                            ),
                            onPressed: () {
                              DatePicker.showTimePicker(
                                context,
                                theme: DatePickerTheme(
                                  containerHeight: 250.0,
                                ),
                                showTitleActions: true,
                                onConfirm: (time) {
                                  _toTime = time;
                                  setState(() {
                                    _toTimeStr =
                                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                                  });
                                },
                                currentTime:
                                    DateTime.now().add(Duration(hours: 1)),
                                locale: LocaleType.en,
                                showSecondsColumn: false,
                              );
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black38,
                        indent: 20,
                        endIndent: 20,
                        height: 0,
                      ),
                      // Number of people label
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Text('Number of people'),
                      ),
                      // TextFormField for input number of people
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          controller: _txtNumOfPeople,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.orange,
                          style: TextStyle(fontSize: 15, color: Colors.black38),
                          decoration: InputDecoration(
                            hintText: '0',
                          ),
                        ),
                      ),
                      // Room type label
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Text('Room type'),
                      ),
                      // Room type drop down button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: DropdownButton(
                          value: _selectedRoomType,
                          items: _listRoomType.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value,
                              ),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedRoomType = value;
                            });
                          },
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                          underline: Divider(
                            thickness: 1,
                            color: Colors.black38,
                            height: 0,
                          ),
                          isExpanded: true,
                        ),
                      ),
                      // Search button
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 50,
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.orange,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // label comfirm
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Text(
                      'Room schedule on ${_dateSelected.day.toString().padLeft(2, '0')}/${_dateSelected.month.toString().padLeft(2, '0')}/${_dateSelected.year.toString().padLeft(2, '0')} ${(_fromTime != null && _toTime != null) ? 'from $_fromTimeStr - $_toTimeStr' : ''}'),
                ),
                SafeArea(
                  top: false,
                  right: true,
                  left: true,
                  child: Column(
                    children: [
                      Room(),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class Room extends StatelessWidget {
  const Room({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1),
        ],
      ),
      child: FlatButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/image 3.png'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'EMPTY',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'R201',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Classroom',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.layers,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '20 m2',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'At most 30',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details()));
                },
                child: Icon(
                  Icons.event_available,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
