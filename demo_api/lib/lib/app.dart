
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/calendar_detail.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: CalendarDetails(),
    );
  }
}
