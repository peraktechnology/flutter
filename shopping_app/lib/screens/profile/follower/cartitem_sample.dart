import 'package:flutter/material.dart';

class CartItemSample extends StatelessWidget {
  const CartItemSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 189, 190, 203),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/follower.png"),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 14.0, left: 10.0),
                    child: Text(
                      "Kshtriz",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Mumbai",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8081B9)),
            child: const Text("unfollow"),
          )
        ],
      ),
    );
  }
}
