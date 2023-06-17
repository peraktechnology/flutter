import 'package:flutter/material.dart';

class RoundedAlertBox extends StatefulWidget {
  const RoundedAlertBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RoundedAlertBoxState createState() => _RoundedAlertBoxState();
}

class _RoundedAlertBoxState extends State<RoundedAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: SizedBox(
        width: 300.0,
        height: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 4),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Follow",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    const Divider(
                      color: Colors.black87,
                      height: 4.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Hide",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    const Divider(
                      color: Colors.black87,
                      height: 4.0,
                      indent: 1,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Share",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    const Divider(
                      color: Colors.black87,
                      height: 4.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Report",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    const Divider(
                      color: Colors.black87,
                      height: 5.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
// }
