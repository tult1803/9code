class Room {
  String code;
  String name;

  Room(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }
}
