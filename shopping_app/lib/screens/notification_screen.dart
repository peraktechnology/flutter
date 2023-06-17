import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text("Notification", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: const Color(0xFFCFD0E5)),
      body: Container(
        margin: const EdgeInsets.only(left: 10, top: 24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 8,
              ),
              alignment: AlignmentDirectional.topStart,
              child: const Text(
                "Today",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 5; i++)
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/profile.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "John Doe",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "10 min ago",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Going to live in today",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "7:00pm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            Container(
              margin: const EdgeInsets.only(
                left: 8,
                top: 30,
              ),
              alignment: AlignmentDirectional.topStart,
              child: const Text(
                "22 Jan 2001",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 2; i++)
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/profile.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "John Doe",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "10 min ago",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Going to live in today",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "7:00pm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
