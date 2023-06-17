import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/pages/login.dart';
import 'package:ecom_firebase_user_07/pages/view_product_page.dart';
import 'package:flutter/material.dart';

class Launcher extends StatelessWidget {
  static const String routeName='/launcher';
  const Launcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,
        () {
          if (AuthService.currentUser != null) {
            Navigator.pushReplacementNamed(context, ViewProductPage.routeName);
          }
          else {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          }
        }
    );

    return Scaffold(
      body:Center(
        child:CircularProgressIndicator(),
      ),
    );
  }
}
