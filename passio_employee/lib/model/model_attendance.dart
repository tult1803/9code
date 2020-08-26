class AttendanceAPI{
  final int  status, store_id;
  final String employee_id, shift_min, shift_max, store_name;

  AttendanceAPI({this.employee_id, this.status, this.store_id, this.shift_min, this.shift_max, this.store_name});

  factory AttendanceAPI.fromJson(Map<dynamic, dynamic> json){
    return AttendanceAPI(
      employee_id: json['employee_id'],
      status: json['status'],
      shift_min: json['shift_min'],
      shift_max: json['shift_max'],
      store_id: json['store_id'],
      store_name: json['store_name'],
    );
  }


}