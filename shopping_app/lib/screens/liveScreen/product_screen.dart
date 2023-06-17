import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

List myColors = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.indigo,
  Colors.purple,
];

Color primaryColor = myColors[0];

class _ProductScreenState extends State<ProductScreen> {
  int _cart = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Icon(Icons.shopping_cart_outlined)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                Stack(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      "https://images.pexels.com/photos/10676414/pexels-photo-10676414.jpeg?auto=compress&cs=tinysrgb&w=600",
                      height: 200,
                      width: 800,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                          color: Color(0xFF6667AB),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  )
                ]),
                const SizedBox(height: 10),
                Container(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 10),
                                child: Text(
                                  "Leather Sling Bag",
                                  style: TextStyle(
                                      color: Color(0xFF3F3F46),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                child: const Text(
                                  "Rs 400",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 270,
                            child: const Text(
                                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',.",
                                style: TextStyle(fontSize: 12)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Text(
                                  "Product Rating",
                                  style: TextStyle(
                                      color: Color(0xFF3F3F46),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 5),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFF6667AB),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFF6667AB),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFF6667AB),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFF6667AB),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Color(0xFF6667AB),
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text("Select Color",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                                  .withOpacity(0.6))),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: buildColorIcons()),
                                  ],
                                ),
                              ),
                              Container(
                                width: 86,
                                alignment: Alignment.topLeft,
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("Quantity",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff71717A))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 25,
                                          margin: EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFE4E4E7)),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 5,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white,
                                                          elevation: 0),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_cart > 0) {
                                                        _cart--;
                                                      }
                                                    });
                                                  },
                                                  child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.black,
                                                      size: 20),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                child: Text(
                                                  _cart.toString(),
                                                ),
                                              ),
                                              Container(
                                                width: 15,
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white,
                                                          elevation: 0),
                                                  onPressed: () {
                                                    setState(() {
                                                      _cart++;
                                                    });
                                                  },
                                                  child: const Icon(Icons.add,
                                                      color: Colors.black,
                                                      size: 20),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: SlideAction(
                          elevation: 0,
                          height: 55,
                          sliderButtonIconSize: 10,
                          sliderButtonIcon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 8,
                          ),
                          outerColor: const Color(0xFF6667AB),
                          onSubmit: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF6667AB),
                              borderRadius: BorderRadius.circular(110),
                            ),
                            child: const Center(
                              child: Text(
                                "Swipe to Buy",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ]),
          ],
        ));
  }
}

Widget buildColorIcons() {
  return Container(
    width: 170,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: const Color(0xFFE4E4E7),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Positioned(
        child: Row(
      children: [
        for (var i = 0; i < 5; i++) buildIconBtn(myColors[i]),
      ],
    )),
  );
}

Widget buildIconBtn(Color myColor) {
  // new
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 2),
    child: Stack(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: myColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Icon(
            Icons.check,
            color: primaryColor == myColor ? myColor : Colors.transparent,
            size: 15,
          ),
        )
      ],
    ),
  );
}
