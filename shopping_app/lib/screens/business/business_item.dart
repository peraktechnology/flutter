import 'package:flutter/material.dart';
import 'package:shoppinglive/screens/business/addproduct_alert.dart';

class BusinessItem extends StatelessWidget {
  const BusinessItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.fromLTRB(
            20,
            12,
            0,
            10,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AddAlertBox();
                          });
                    },
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 0.75,
          children: [
            for (int i = 0; i < 12; i++)
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 12.0, left: 12, right: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4E4E7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Expanded(
                            child: (Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Image.asset(
                                    'assets/product.png',
                                    fit: BoxFit.cover,
                                    height: 160,
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
                                        height: 5,
                                      ),
                                      Text(
                                        "Rs 40000")
                                    ],
                                  ),
                                )
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ],
    ));
  }
}
