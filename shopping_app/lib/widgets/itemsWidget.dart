import 'package:flutter/material.dart';
import 'package:shoppinglive/widgets/itemcard.dart';
import 'package:shoppinglive/widgets/upcomingLive.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GridView.count(
        childAspectRatio: 0.77,
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2.0,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: const [
          ItemCard(
            title: "Yuzi_20",
            subtitle: "Artist",
            index: 1,
          ),
          ItemCard(
            title: "Alice_rip",
            subtitle: "Wallets",
            index: 2,
          ),
          ItemCard(
            title: "cris_345",
            subtitle: "shoes",
            index: 3,
          ),
          ItemCard(
            title: "Jack zones",
            subtitle: "Makeup Product",
            index: 4,
          ),
        ],
      ),
    );
  }
}
