import './api_result_model.dart';

class ApiResponseModel {
  List<ApiResultModel> results;
  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    List<ApiResultModel> temp = [];
    for (int i = 0; i < json['results'].length; i++) {
      ApiResultModel apiResult = ApiResultModel.fromJson(json['results'][i]);
      temp.add(apiResult);
    }
    results = temp;
  }
}
