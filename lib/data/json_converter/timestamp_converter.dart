// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime?, Object> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    }
    return null;
  }

  @override
  Object toJson(DateTime? date) {
    if (date == null) {
      return FieldValue.serverTimestamp();
    }
    return Timestamp.fromDate(date);
  }
}
