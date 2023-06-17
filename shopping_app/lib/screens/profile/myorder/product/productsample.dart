import 'package:flutter/material.dart';

class ProductSample extends StatelessWidget {
  const ProductSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFCFD0E5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/aqua.png"),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 14.0, left: 10.0),
                    child: Text(
                      "Aqua Wave Facewash",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "200rs",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
