import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/profile/follower/follower_profile.dart';
import 'package:shoppinglive/screens/profile/myorder/order_section.dart';
import 'package:shoppinglive/screens/profile/profile_screen.dart';

class UserProduct extends StatelessWidget {
  const UserProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 242, 240, 240),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, FollowerProfile.routeName);
                },
                child: Column(
                  children: const [
                    Text(
                      "329",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(color: Color(0xFF71717A)),
                    ),
                  ],
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/profileimg.png",
                  width: 200,
                  height: 200,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    const Text(
                      "05",
                      style: TextStyle(color: Color(0xFF4D4E8C)),
                    ),
                    const Text(
                      "My Orders",
                      style: TextStyle(color: Color(0xFF8081B9)),
                    ),
                    Container(
                      height: 1.0,
                      width: 70.0,
                      color: const Color(0xFF8081B9),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Kshitij Dumbre",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 63,
                      height: 20,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffCFD0E5),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "View all",
                              style: TextStyle(
                                  color: Color(0xff27272A), fontSize: 8),
                            ),
                            // Text(
                            //   "all",
                            //   style: TextStyle(
                            //       color: Color(0xff27272A), fontSize: 8),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ProfileScreen.routeName);
                },
                child: Column(
                  children: const [
                    Text(
                      "05",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Products",
                      style: TextStyle(
                        color: Color(0xff71717A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
