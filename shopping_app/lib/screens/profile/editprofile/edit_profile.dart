import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/editprofile";
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x1A000000),
        title: const Text(
          "Profile",
          style: TextStyle(color: Color(0xFF27272A), fontSize: 19),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Color(0xFF737373),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/profilegirl.png"),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 18),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Personal Information",
                      style: TextStyle(
                        color: Color(0xFF6667AB),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  _buildTextField(
                    hintText: "Enter The username",
                    label: "UserName",
                  ),
                  _buildTextField(
                    hintText: "Enter The Number",
                    label: "Number",
                  ),
                  _buildTextField(
                    hintText: "Enter The City",
                    label: "City",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Address",
                style: TextStyle(
                  color: Color(0xFF6667AB),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            _buildTextField(
              hintText: "Enter your Address",
              label: "Building Name",
            ),
            _buildTextField(
              hintText: "Enter The Number",
              label: "Landmart",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "House No",
                        hintText: "Enter The House no",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: "Pincode",
                            hintText: "Enter The Pin Code",
                            contentPadding: EdgeInsets.all(10))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            Container(
              padding: const EdgeInsets.only(left: 18),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Card details",
                style: TextStyle(
                  color: Color(0xFF6667AB),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            _buildTextField(
              hintText: "Enter Card Holder name",
              label: "Card Holder Name",
            ),
            _buildTextField(
              hintText: "Enter The Card Number",
              label: "Card Number",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Pin",
                        hintText: "Enter The Pin",
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "CVV",
                        hintText: "Enter The CVV",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _buildTextField(
              hintText: "Enter The UPI Id",
              label: "UPI id",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required String label}) {
    // new
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
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
        style: const TextStyle(color: Color(0x99000000), fontSize: 15),
      ),
    );
  }
}
