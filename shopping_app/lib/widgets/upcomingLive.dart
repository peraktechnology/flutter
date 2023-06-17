import 'package:flutter/material.dart';
import 'package:shoppinglive/widgets/itemcard.dart';

class UpcomingLive extends StatelessWidget {
  const UpcomingLive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7FB),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.3),
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
