import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String value = "", subtitle = "";

  InfoCard({super.key, required this.value, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFCFD0E5),
              ),
              child: const Icon(
                Icons.all_inbox_rounded,
                size: 30,
              ),
            ),
            Column(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Text(subtitle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
