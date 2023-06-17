// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppinglive/colors/color.dart';
import 'package:shoppinglive/resources/auth_methods.dart';
import 'package:shoppinglive/screens/home_screen.dart';
import 'package:shoppinglive/screens/authentication/signup_screen.dart';
import 'package:shoppinglive/widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  loginUser() async {
    bool res = await _authMethods.loginUser(
        context, emailController.text, passwordController.text);
    if (res) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: SizedBox(
                  width: 500,
                  height: 300,
                  child: Image.asset("assets/bg.jpg"),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Email id',
                  icon: Icon(
                    Icons.email_outlined,
                    color: Color(0xFF1B1D22),
                  ),
                ),
                onSaved: (value) {
                  emailController.text = value!;
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: TextFormField(
                autofocus: false,
                controller: passwordController,
                onSaved: (value) {
                  passwordController.text = value!;
                },
                textInputAction: TextInputAction.done,
                obscureText: showPassword,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  contentPadding: const EdgeInsets.only(bottom: 6),
                  hintText: 'Password',
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xFF1B1D22),
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (showPassword) {
                          showPassword = false;
                        } else {
                          showPassword = true;
                        }
                      });
                    },
                    icon: Icon(showPassword == true
                        ? Icons.remove_red_eye_outlined
                        : Icons.password),
                  ),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topEnd,
              margin: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 15, color: Colors.black54, fontFamily: 'inter'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 370,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: ElevatedButton(
                onPressed: loginUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6667AB),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 145.0,
                      color: Colors.black45,
                    ),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(fontSize: 20.0, color: Colors.black45),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 145.0,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidgets.socialButtonCircle(
                    facebookColor,
                    FontAwesomeIcons.facebookF,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                  CustomWidgets.socialButtonCircle(
                    googleColor,
                    FontAwesomeIcons.googlePlusG,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                  CustomWidgets.socialButtonCircle(
                    linkedinColor,
                    FontAwesomeIcons.linkedinIn,
                    iconColor: Colors.white,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account?",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    }),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: Color(0xFF6667AB),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
