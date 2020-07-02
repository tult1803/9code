

import 'dart:async';

import 'package:demoapi/lib/blocs/bloc.dart';
import 'package:demoapi/lib/models/calendar_detail_model.dart';
import 'package:demoapi/lib/resources/calendar_detail_repository.dart';



class CalendarDetailBloc implements Bloc{
  final _controller = StreamController<CalendarDetailModel>();
  final CalendarDetailRepository _provider = CalendarDetailRepository();
  Stream<CalendarDetailModel> get stream => _controller.stream; //get steam đưa dữ liệu
  CalendarDetailModel _listBooking;
  CalendarDetailModel get listBooking => _listBooking;
  Future loadRoom(String id) async {
    _listBooking = await _provider.fetchRoom(id); // goi api lay du lieu
    _controller.sink.add(_listBooking); // add vô stream ra. Sink là add
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
  }
}