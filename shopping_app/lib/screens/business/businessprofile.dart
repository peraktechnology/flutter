import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/business/businessfollower.dart';
import 'package:shoppinglive/screens/business/infocard.dart';
import 'package:shoppinglive/widgets/itemcard.dart';

import '../profile/editprofile/edit_profile.dart';
import '../profile/follower/follower_profile.dart';
import '../profile/myorder/order_section.dart';

class BusinessProfile extends StatelessWidget {
  const BusinessProfile({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, BusinessFollower.routeName);
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
              ),
             
                Expanded(
                  child: Container(
                    child: Image.asset(
                      "assets/profileimg.png",
                      width: 200,
                      height: 200,
                    ),
                  
                              ),
                ),
              Expanded(
                child: TextButton(
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
                        "Following",
                        style: TextStyle(color: Color(0xff71717A)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Kshitij Dumbre",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        iconSize: 20,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, EditProfile.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffCFD0E5),
                        ),
                        icon: Icon(Icons.info_outline)),
                  ],
                ),
              ),
              const SizedBox(
                width: 350,
                child: Text(
                    'Amet minim mollit non deserunt ullamco est sit aliqu dolor do amet sint. Velit officia consequat....'),
              ),
              Container(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB5B6D6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('Business')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Column(
              //     children: [
              //       const Text(
              //         "05",
              //         style: TextStyle(
              //           color: Color(0xFF4D4E8C),
              //         ),
              //       ),
              //       const Text(
              //         "Products",
              //         style: TextStyle(
              //           color: Color(0xFF8081B9),
              //         ),
              //       ),
              //       Container(
              //         height: 1.0,
              //         width: 70.0,
              //         color: const Color(0xFF8081B9),
              //       ),
              //     ],
              //   ),
              // ),

              Container(
                width: 370,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFE4E4E7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2.0,
                    color: Color.fromARGB(255, 210, 210, 211),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              width: 360,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InfoCard(value: "987", subtitle: "VIDEOS"),
                                  InfoCard(value: "987", subtitle: "Products"),
                                ],
                              )),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 140, top: 20),
                      child: InfoCard(value: "987", subtitle: "Sales"),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
