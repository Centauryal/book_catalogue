import 'dart:convert';

class ResultInformation {
  final String? message;
  final int? status;

  const ResultInformation({this.message, this.status});

  Map<String, dynamic> toJson() => {'message': message, 'status': status};

  @override
  String toString() {
    return jsonEncode(this);
  }
}
