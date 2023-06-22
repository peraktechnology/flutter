import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_navigator.dart';
import '../views/register_Screen.dart';

class MyTextButton extends StatelessWidget {

  final function;
  double width;
  final text;


  MyTextButton({required this.function,required this.width,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: width,
      decoration: BoxDecoration(
          color: Color(0xff214eff)
      ),
      child: TextButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
    );
  }
}
