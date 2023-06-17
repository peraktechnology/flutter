import 'package:cloud_firestore/cloud_firestore.dart';


const String dateFieldTimestamp='timestamp';
const String dateFieldDay='day';
const String dateFieldMonth='month';
const String dateFieldYear='year';

class DateModel{
  Timestamp timestamp;
  num day,month,year;

  DateModel({
    required this.timestamp,
    required  this.day,
    required this.month,
    required this.year,
  });

  Map<String,dynamic>toMap(){
    return <String,dynamic>{
      dateFieldTimestamp:timestamp,
      dateFieldDay:day,
      dateFieldMonth:month,
      dateFieldYear:year,
    };
  }

  factory DateModel.fromMap(Map<String,dynamic>map)=>DateModel(
      timestamp: map[dateFieldTimestamp],
      day: map[dateFieldDay],
      month:map[dateFieldMonth],
      year: map[dateFieldYear],
  );
}