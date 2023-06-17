import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/business/business_cart.dart';
import 'package:shoppinglive/screens/business/businessfollower_profile.dart';
import 'package:shoppinglive/screens/profile/follower/FollowerCart.dart';

class BusinessFollower extends StatefulWidget {
  static const routeName = "/follower";
  const BusinessFollower({super.key});

  @override
  State<BusinessFollower> createState() => _BusinessFollowerState();
}

class _BusinessFollowerState extends State<BusinessFollower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCFD0E5),
        title: Image.asset(
          "assets/logo.png",
          height: 100,
          width: 100,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: const [
          BusinessFollowerProfile(),
          BusinessCart(),
        ],
      ),
    );
  }
}
