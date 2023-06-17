import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/profile/follower/cartitem_sample.dart';

class BusinessCart extends StatelessWidget {
  const BusinessCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.line_weight_outlined),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
              "Followers",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          CartItemSample(),
          CartItemSample(),
          CartItemSample(),
          CartItemSample(),
        ],
      ),
    );
  }
}
