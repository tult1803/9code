

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/details_booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  static String tapped ='';
  CalendarController _controller;
  Map<DateTime, List> _events;
  List _selectedEvents;
  static String day = '';
  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    day = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
    _controller = CalendarController();
    final _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 0)):  ['Sân bóng SWD   4.5', 'Sân bóng HCI   5.0', 'Sân bóng PRM   3.5'],
      _selectedDay.subtract(Duration(days: -1)): ['Sân bóng ACC   3.0', 'Sân bóng ISC   4.0'],
      _selectedDay.subtract(Duration(days: -2)): ['Sân bóng SWD   4.5', 'Sân bóng ISC   4.0', 'Sân bóng HCI   5.0'],
      _selectedDay.subtract(Duration(days: -3)): ['Sân bóng ACC   3.0', 'Sân bóng PRM   3.5', 'Sân bóng HCI   5.0', 'Sân bóng ISC   4.0'],
      _selectedDay.subtract(Duration(days: -4)): ['Sân bóng HCI   5.0', 'Sân bóng PRM   3.5', 'Sân bóng ACC   3.0', 'Sân bóng SWD   4.5', 'Sân bóng ISC   4.0'],
      _selectedDay.subtract(Duration(days: -5)): ['Sân bóng SWD   4.5', 'Sân bóng HCI   5.0', 'Sân bóng PRM   3.5', 'Sân bóng ACC   3.0', 'Sân bóng ISC   4.0'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white70,
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                initialCalendarFormat: CalendarFormat.week,
                calendarController: _controller,
                events: _events,
                onDaySelected: _onDaySelected,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.lightGreen,
                  selectedColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  void _onDaySelected(DateTime days, List events) {
    setState(() {
      _selectedEvents = events; // cap nhat va show danh sách
      day = '${days.day}-${days.month}-${days.year}';
      print('onDaySelected: $day');
    });
  }
  Widget _buildEventList(){
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          trailing: Text('Chi tiết', style: TextStyle(color: Colors.blue, fontSize: 15),),
          title: Row(
            children: [
              Text(event.toString(), style: GoogleFonts.yrsa(fontSize: 27, fontWeight: FontWeight.w500),),
              Icon(Icons.star ,color: Colors.black,),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mở cửa: 8h - 22h', style: TextStyle(fontSize: 16,),),
              Container(
                // margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.watch_later_outlined, size: 15,),
                    Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                    // Icon(Icons.),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            print('$event tapped!');
//            Demo nhan tapped
            setState(() {
              tapped = event;
            });

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsBooking()));
          }
        ),
      ))
          .toList(),
    );
  }
}
