import 'package:flutter/material.dart';
import 'package:shoppinglive/widgets/alertbox.dart';

class ItemCard extends StatelessWidget {
  final String title, subtitle;
  final int index;
  const ItemCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/item$index.png",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    "Live",
                    style: TextStyle(
                        fontFamily: "inter",
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
         
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF27272A),
                          fontFamily: "Inter",
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFFA1A1AA),
                          fontFamily: "Inter",
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return RoundedAlertBox();
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Image.asset(
                      "assets/dots.png",
                      height: 23,
                      width: 23,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
