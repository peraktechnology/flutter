import 'package:flutter/material.dart';

class SingleProductCard extends StatelessWidget {
  final String productImage, productName, productPrice;
  const SingleProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: const Offset(3, 2),
              blurRadius: 7,
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                productImage,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      color: Color(0xFF3F3F46), fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productPrice,
                  style: const TextStyle(
                      color: Color(0xFF6667AB), fontWeight: FontWeight.w300),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
