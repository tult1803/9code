class Attached {
  String code;
  String name;

  Attached(Map<String, String> json) {
    code = json['code'];
    name = json['name'];
  }
}
