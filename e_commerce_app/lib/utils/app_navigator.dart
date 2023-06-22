import 'package:flutter/material.dart';

class AppNavigator{

  AppNavigator(context,isFinal,screen){
    if(isFinal==true){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    }else {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen));
    }
  }}