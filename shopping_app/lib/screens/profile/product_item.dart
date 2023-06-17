import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.fromLTRB(
            20,
            12,
            0,
            10,
          ),
          child: const Text(
            'Product',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 0.75,
          children: [
            for (int i = 0; i < 12; i++)
              Container(
                margin: const EdgeInsets.only(
                    top: 12.0, left: 12, right: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4E4E7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: (Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 0),
                            child: Image.asset(
                              'assets/product.png',
                              fit: BoxFit.contain,
                              height: 180,
                              width: 180,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 12, top: 12),
                                  child: Text(
                                    "Nikon Camera",
                                    style: TextStyle(color: Color(0xFF3F3F46)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Rs 40000")
                              ],
                            ),
                          )
                        ],
                      )),
                    )
                  ],
                ),
              )
          ],
        ),
      ],
    ));
  }
}
