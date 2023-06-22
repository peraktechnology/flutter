import 'package:e_commerce_app1/services/dio_helper/dio_helper.dart';
import 'package:e_commerce_app1/services/sp_helper/sp_helper.dart';
import 'package:e_commerce_app1/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  DioHelper.init();
  await Firebase.initializeApp();
  runApp( AppRoot());
}