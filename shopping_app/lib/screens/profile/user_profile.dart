import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/profile/editprofile/edit_profile.dart';
import 'package:shoppinglive/screens/profile/follower/follower_profile.dart';
import 'package:shoppinglive/screens/profile/myorder/order_section.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      style: TextStyle(color: Color(0xff71717A)),
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
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, OrderSection.routeName);
                },
                child: Column(
                  children: const [
                    Text(
                      "05",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "My Orders",
                      style: TextStyle(color: Color(0xff71717A)),
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
                      width: 55,
                      height: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, EditProfile.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffCFD0E5),
                        ),
                        child: const Text(
                          "Edit",
                          style:
                              TextStyle(color: Color(0xff27272A), fontSize: 12),
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
                onPressed: () {},
                child: Column(
                  children: [
                    const Text(
                      "05",
                      style: TextStyle(
                        color: Color(0xFF4D4E8C),
                      ),
                    ),
                    const Text(
                      "Products",
                      style: TextStyle(
                        color: Color(0xFF8081B9),
                      ),
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
          )
        ],
      ),
    );
  }
}
