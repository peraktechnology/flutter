import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/profile/follower/user_follower.dart';
import 'package:shoppinglive/screens/profile/user_profile.dart';

import 'FollowerCart.dart';

class FollowerProfile extends StatelessWidget {
  static const routeName = 'follower';
  const FollowerProfile({super.key});

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
        color: Color.fromARGB(255, 242, 240, 240),
        child: ListView(
          children: const [            
            UserFollower(),
            FollowerCart(),
          ],
        ),
      ),
    );
  }
}
