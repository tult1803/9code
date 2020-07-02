class ApiResultModel {
  String message;
  Map<String, dynamic> data;
  int code;

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    code = json['code'];
  }
}
