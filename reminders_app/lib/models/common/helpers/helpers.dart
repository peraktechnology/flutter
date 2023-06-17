import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(int milliSecondsFromEpoch) {
  return DateFormat.yMMMd().format(
    DateTime.fromMillisecondsSinceEpoch(milliSecondsFromEpoch),
  );
}

String formatTime(BuildContext context, int hour, int minute) {
  return TimeOfDay(hour: hour, minute: minute).format(context);
}

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Theme.of(context).accentColor,
      ),
    ),
    duration: const Duration(seconds: 1),
    backgroundColor: Theme.of(context).cardColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
