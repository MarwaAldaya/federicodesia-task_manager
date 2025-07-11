import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    if (json.contains('.')) {
      json = json.substring(0, json.length - 1);
    }

    return DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'en').parse(json, true).toLocal();
  }

  @override
  String toJson(DateTime? json) => json!.toIso8601String();
}

class TimestampOrStringConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampOrStringConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    return null;
  }

  @override
  dynamic toJson(DateTime? date) => date?.toIso8601String();
}
