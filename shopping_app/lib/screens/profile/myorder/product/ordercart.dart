import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoppinglive/screens/profile/follower/cartitem_sample.dart';
import 'package:shoppinglive/screens/profile/myorder/product/productsample.dart';

class OrderCart extends StatelessWidget {
  const OrderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.two_k_outlined),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
              "Orders",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ProductSample(),
          ProductSample(),
          ProductSample(),
          ProductSample()
        ],
      ),
    );
  }
}
