import 'package:demoapi/lib/models/calendar_detail_model.dart';

import '../models/api_response_model.dart';

import './api_provider.dart';

class CalendarDetailRepository {
  ApiProvider apiProvider = ApiProvider();
  final String apiEndPoint = '/api/bookings';
  Future<List<CalendarDetailModel>> fetchListRoom(Map<String, String> header) async {
    ApiResponseModel res =
    await apiProvider.fetchData(apiEndPoint, 'get', header, {});
    if (res != null) {
      List<CalendarDetailModel> listRoom = [];
      res.results.forEach((element) {
        if (element.message.compareTo('Success') == 0) {
          List list = element.data['results'];
          list.forEach((element) {
            CalendarDetailModel roomModel = CalendarDetailModel(element);
            listRoom.add(roomModel);
          });
        }
      });
      return listRoom;
    } else {
      return null;
    }
  }

  Future<CalendarDetailModel> fetchRoom(String id) async {
    ApiResponseModel res =
    await apiProvider.fetchData('$apiEndPoint/$id', 'get', {}, {});
    if (res != null) {
      CalendarDetailModel roomModel;
      res.results.forEach((element) {
        if (element.message.compareTo('Success') == 0) {
          Map<String, dynamic> map = element.data;
          roomModel = CalendarDetailModel(map);
        }
      });
      return roomModel;
    } else {
      return null;
    }
  }
}
