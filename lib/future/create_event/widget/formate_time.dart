import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimeAMPM(TimeOfDay time) {
  final now = DateTime.now();

  final dateTime = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  return DateFormat('hh:mm a').format(dateTime);
}
