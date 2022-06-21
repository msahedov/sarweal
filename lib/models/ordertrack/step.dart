import 'dart:convert';
import 'status.dart';

class Step {
  String? code;
  List<Status>? status;

  Step({this.code, this.status});

  factory Step.fromFrom(Map<String, dynamic> data) => Step(
        code: data['code'] as String?,
        status: (data['status'] as List<dynamic>?)?.map((e) => Status.fromMap(e as Map<String, dynamic>)).toList(),
      );

  factory Step.fromJson(String data) {
    return Step.fromFrom(json.decode(data) as Map<String, dynamic>);
  }
}
