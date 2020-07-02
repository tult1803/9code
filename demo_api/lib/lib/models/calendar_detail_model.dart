import 'package:demoapi/lib/models/roomc_model.dart';

import 'attached_services_model.dart';

class CalendarDetailModel {
  int id;
  String code, note, feedback;
  int num_of_people;
  Room room;
  String status, book_person, using_person;
  String booked_date, from_time, to_time;
  Attached attached_services;
  String manager_message;

  CalendarDetailModel(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    if (json['room'] != null) {
      room = Room(json['room']);
    }
    status = json['status'];
    booked_date = json['booked_date'];
    from_time = json['from_time'];
    to_time = json['to_time'];
    num_of_people = json['num_of_people'];
    if (json['attached_services'] != null) {
      attached_services = Attached(json['attached_services']);
    }
    book_person = json['book_person'];
    using_person = json['using_person'];
    note = json['note'];
    feedback = json['feedback'];
    manager_message = json['manager_message'];

  }
}
