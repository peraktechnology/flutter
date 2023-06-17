import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/business/business_item.dart';
import 'package:shoppinglive/screens/business/businessprofile.dart';
import 'package:shoppinglive/screens/profile/product_card.dart';
import 'package:shoppinglive/screens/profile/product_item.dart';
import 'package:shoppinglive/screens/profile/user_profile.dart';
import 'package:shoppinglive/widgets/itemsWidget.dart';

class BusinessLiveScreen extends StatefulWidget {
  static const routeName = "/business";
  const BusinessLiveScreen({super.key});

  @override
  State<BusinessLiveScreen> createState() => _BusinessLiveScreenState();
}

class _BusinessLiveScreenState extends State<BusinessLiveScreen> {
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
          BusinessProfile(),
          BusinessItem(),
        ],
      ),
    );
  }
}
