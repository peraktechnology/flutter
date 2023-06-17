import 'package:flutter/material.dart';

class AddAlertBox extends StatefulWidget {
  const AddAlertBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddAlertBoxState createState() => _AddAlertBoxState();
}

class _AddAlertBoxState extends State<AddAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: SizedBox(
        width: 900.0,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(children: <Widget>[
              InkWell(
                child: Container(
                  alignment: Alignment.topLeft,
                  // padding:
                  //     const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0)),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Column(children: [
                Container(
                    padding: const EdgeInsets.only(left: 6, top: 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Product information",
                      style: TextStyle(
                          color: Color(0xFF6667AB),
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    )),
                Container(
                  child: Column(
                    children: [
                      _buildTextField(
                          hintText: "Enter The Product Name",
                          label: "Product name"),
                      _buildTextField(
                          hintText: "Enter The Product Description",
                          label: "Product Description"),
                      _buildTextField(
                          hintText: "Enter the Product Price",
                          label: "Product Price"),
                      _buildTextField(
                          hintText: "Enter the Product Url",
                          label: "Product Url"),
                      Column(
                        children: [
                          _buildTextField(
                              hintText: "Enter the Product Color",
                              label: "Product Available Colors"),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                child: Text(
                                  "#Blue",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                child: Text(
                                  "#Black",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                child: Text(
                                  "#Red",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                child: Text(
                                  "#Yellow",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 5),
                                  
                                    child: Text(
                                      "#Green",
                                      style: TextStyle(
                                          color: Color(0xFF8081B9),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                              
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          _buildTextField(
                              hintText: "Enter the Product Size",
                              label: "Product Available Size"),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 5),
                                child: Text(
                                  "#28",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 5),
                                child: Text(
                                  "#30",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 5),
                                child: Text(
                                  "#32",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 5),
                                child: Text(
                                  "#34",
                                  style: TextStyle(
                                      color: Color(0xFF8081B9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 5),
                                  child: Text(
                                    "#35",
                                    style: TextStyle(
                                        color: Color(0xFF8081B9),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6667AB),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add Item",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ]),
          ],
        ),
      ),
    );
  }

// class AlertBox extends StatelessWidget {
//   const AlertBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       actions: <Widget>[
//         Column(
//           children: [
//             Container(
//               alignment: Alignment.bottomLeft,
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back)),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Column(
//                 children: [
//                   TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Follow",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                       )),
//                   TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Hide",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                       )),
//                   TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Share",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                       )),
//                   TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Report",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400),
//                       )),
//                 ],
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }

  Widget _buildTextField({required String hintText, required String label}) {
    // new
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          isCollapsed: false,
          contentPadding: const EdgeInsets.only(bottom: 7),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          hintText: hintText,
          label: Text(
            label,
            style: const TextStyle(fontSize: 17, color: Color(0xFF71717A)),
          ),
        ),
        style: const TextStyle(color: Color(0xFF3F3F46), fontSize: 12),
      ),
    );
  }
}
