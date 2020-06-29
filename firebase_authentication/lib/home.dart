import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthentication/room_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'approval_tab.dart';
import 'booking_tab.dart';
import 'calendar_tab.dart';
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.av_timer,
            color: Colors.orange,
          ),
          title: Text(
            'Calendar',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.done,
            color: Colors.orange,
          ),
          title: Text(
            'Approval',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.event_available,
            color: Colors.orange,
          ),
          title: Text(
            'Booking',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.orange,
          ),
          title: Text(
            'Room',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
      ]),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: CalendarTab(),
                );
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ApprovalTab(),
                );
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: BookingTab(),
                );
              },
            );
            break;
          case 3:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: RoomTab(),
                );
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}
