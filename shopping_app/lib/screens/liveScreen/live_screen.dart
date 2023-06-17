import 'package:flutter/material.dart';
import 'package:hmssdk_flutter/hmssdk_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglive/screens/liveScreen/product_details.dart';
import 'package:shoppinglive/screens/liveScreen/product_screen.dart';
import '../../models/data_store.dart';
import '../../services/sdk_initializer.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  bool isLocalAudioOn = true;
  bool isLocalVideoOn = true;
  int followers = 250;
  Offset position = const Offset(10, 10);

  Future<bool> leaveRoom() async {
    SdkInitializer.hmssdk.stopHlsStreaming();
    SdkInitializer.hmssdk.leave();
    Navigator.pop(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final _isVideoOff = context.select<UserDataStore, bool>(
        (user) => user.remoteVideoTrack?.isMute ?? true);
    final remoteTrack = context
        .select<UserDataStore, HMSTrack?>((user) => user.remoteVideoTrack);

    return WillPopScope(
      onWillPop: () async {
        return leaveRoom();
      },
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                    color: Colors.black.withOpacity(0.9),
                    child: _isVideoOff
                        ? const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.videocam_off,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        : (remoteTrack != null)
                            ? HMSVideoView(
                                track: remoteTrack as HMSVideoTrack,
                                matchParent: false)
                            : const Center(child: Text("No Video"))),
                Positioned(
                  top: 385,
                  right: 15,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () async {
                        //     leaveRoom();
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.red.withAlpha(60),
                        //             blurRadius: 3.0,
                        //             spreadRadius: 5.0,
                        //           ),
                        //         ]),
                        //     child: const CircleAvatar(
                        //       radius: 25,
                        //       backgroundColor: Colors.red,
                        //       child: Icon(Icons.call_end, color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () => {
                            SdkInitializer.hmssdk
                                .switchVideo(isOn: isLocalVideoOn),
                            if (!isLocalVideoOn)
                              SdkInitializer.hmssdk.startCapturing()
                            else
                              SdkInitializer.hmssdk.stopCapturing(),
                            setState(() {
                              isLocalVideoOn = !isLocalVideoOn;
                            })
                          },
                          child: Icon(
                            isLocalVideoOn
                                ? Icons.videocam_outlined
                                : Icons.videocam_off_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => {
                            SdkInitializer.hmssdk
                                .switchAudio(isOn: isLocalAudioOn),
                            setState(() {
                              isLocalAudioOn = !isLocalAudioOn;
                            })
                          },
                          child: Icon(
                            isLocalAudioOn ? Icons.mic : Icons.mic_off,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 15,
                  child: GestureDetector(
                    onTap: () async {
                      leaveRoom();
                    },
                    child: Image.asset(
                      "assets/close.png",
                      height: 18,
                      width: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 15,
                  child: GestureDetector(
                      onTap: () async {
                        leaveRoom();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Khitiz Dumbare",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                height: 19,
                                width: 56,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF4D4E8C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    "Follow",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 7.7),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 20,
                            width: 81,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(
                                          left: 0, right: 2),
                                      child: const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                    const Text("4882",
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )),
                          )
                        ],
                      )),
                ),
                Positioned(
                  top: 730,
                  left: 15,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 0.9 * MediaQuery.of(context).size.width,
                      child: const TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'Type Something...',
                            icon: Icon(
                              Icons.message_outlined,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xffFFFFFF),
                            )),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 565,
                  right: 15,
                  child: GestureDetector(
                    onTap: () {
                      if (isLocalVideoOn) {
                        SdkInitializer.hmssdk.switchCamera();
                      }
                    },
                    child: Image.asset(
                      "assets/switch-camera.png",
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 630,
                  left: 35,
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const ProductScreen();
                            });
                      },
                      child: const ProductDetails()),
                ),
                Positioned(
                  top: 470,
                  right: 15,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            followers++;
                          });
                        },
                        child: Image.asset(
                          "assets/heart.png",
                          height: 25,
                          width: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        followers.toString(),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 525,
                  right: 15,
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/share.png",
                      height: 25,
                      width: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
