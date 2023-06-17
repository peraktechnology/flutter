import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/profile/follower/user_follower.dart';
import 'package:shoppinglive/screens/profile/myorder/product/ordercart.dart';
import 'package:shoppinglive/screens/profile/myorder/product/user_product.dart';
import 'package:shoppinglive/screens/profile/user_profile.dart';

import '../follower/FollowerCart.dart';

class OrderSection extends StatelessWidget {
  static const routeName = 'order';
  const OrderSection({super.key});

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
      body: Container(
        color: const Color.fromARGB(255, 242, 240, 240),
        child: ListView(
          children: const [
            UserProduct(),
            OrderCart(),
          ],
        ),
      ),
    );
  }
}
