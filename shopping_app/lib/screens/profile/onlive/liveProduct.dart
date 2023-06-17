import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglive/models/data_store.dart';
import 'package:shoppinglive/screens/profile/onlive/productview.dart';
import 'package:shoppinglive/services/sdk_initializer.dart';

import '../../../services/join_service.dart';
import '../../liveScreen/live_screen.dart';

class LiveProduct extends StatefulWidget {
  const LiveProduct({super.key});

  @override
  State<LiveProduct> createState() => _LiveProductState();
}

class _LiveProductState extends State<LiveProduct> {
  @override
  void initState() {
    SdkInitializer.hmssdk.build();
    getPermissions();
    super.initState();
  }

  void getPermissions() async {
    await Permission.camera.request();
    await Permission.microphone.request();

    while ((await Permission.camera.isDenied)) {
      await Permission.camera.request();
    }
    while ((await Permission.microphone.isDenied)) {
      await Permission.microphone.request();
    }
    while ((await Permission.bluetoothConnect.isDenied)) {
      await Permission.bluetoothConnect.request();
    }
  }

  late UserDataStore _dataStore;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.transparent),
          child: const Text(
            "Back",
            style: TextStyle(
              color: Color(0xFF737373),
              fontSize: 15,
            ),
          ),
        ),
        backgroundColor: const Color(0xffCFD0E5),
        title: const Text(
          "Going Live",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "video information",
                      style: TextStyle(
                          color: Color(0xFF6667AB),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                Container(
                    child: Column(
                  children: [
                    _buildTextField(
                        hintText: "Enter the thumbnail",
                        label: "Enter Thumbnail"),
                    _buildTextField(
                        hintText: "Enter the photo", label: "Enter Photo")
                  ],
                )),
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Product information",
                      style: TextStyle(
                          color: Color(0xFF6667AB),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
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
                                  horizontal: 12, vertical: 5),
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
                                  horizontal: 12, vertical: 5),
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
                                  horizontal: 12, vertical: 5),
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
                                  horizontal: 12, vertical: 5),
                              child: Text(
                                "#Yellow",
                                style: TextStyle(
                                    color: Color(0xFF8081B9),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              child: Text(
                                "#Green",
                                style: TextStyle(
                                    color: Color(0xFF8081B9),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
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
                            Padding(
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
                          ],
                        )
                      ],
                    ),
                    Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(left: 15, top: 6),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6667AB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Add Product"))),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              width: 170.0,
                              color: Colors.black45,
                            ),
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black45),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 170.0,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 15, top: 12),
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              "Product View",
                              style: TextStyle(
                                  color: Color(0xFF6667AB), fontSize: 20),
                            ),
                          ),
                          const ProductView(),
                          const ProductView(),
                          Container(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 160,
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                    left: 18.0,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Schedule",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 50,
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF6667AB),
                                      ),
                                      onPressed: () async {
                                        bool isJoined = await joinRoom();
                                        if (isJoined) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ListenableProvider.value(
                                                          value: _dataStore,
                                                          child:
                                                              const MeetingScreen())));
                                        } else {
                                          const SnackBar(
                                              content: Text("Error"));
                                        }
                                      },
                                      child: const Text(
                                        "Go Live",
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required String label}) {
    // new
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
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
        style: const TextStyle(color: Color(0xFF3F3F46), fontSize: 15),
      ),
    );
  }

  Future<bool> joinRoom() async {
    setState(() {
      _isLoading = true;
    });

    bool isJoinSuccessful = await JoinService.join(SdkInitializer.hmssdk);
    if (!isJoinSuccessful) {
      return false;
    }
    _dataStore = UserDataStore();

    _dataStore.startListen();

    setState(() {
      _isLoading = false;
    });
    return true;
  }
}
