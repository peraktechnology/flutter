
import 'package:ecom_firebase_user_07/db/db_helper.dart';
import 'package:ecom_firebase_user_07/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier{
  Future<void> addNotification(NotificationModel notification) async{
    await DbHelper.addNotification(notification);
  }
}