import 'dart:convert';

class Status {
  String? createdTime;
  String? code;
  String? note;

  Status({this.createdTime, this.code, this.note});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        createdTime: data['createdTime'] as String?,
        code: data['code'] as String?,
        note: data['note'] as String?,
      );

  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
