import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Image.asset(
              "assets/item1.png",
              height: 60,
              width: 60,
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 60),
                child: const Text(
                  "Product Name",
                  style: TextStyle(color: Color(0xFF080000)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: const Text(
                  "Rs 500",
                  style: TextStyle(color: Color(0xFF000000), fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
