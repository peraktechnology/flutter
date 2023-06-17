import 'package:flutter/material.dart';
import 'package:ios_reminders/services/auth_service.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback toggleView;

  const SignInScreen({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Sign Up'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/images/calendar.json', width: 175),
            Text(
              'Yet another Todo list',
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(hintText: 'Enter email'),
                      validator: (val) => val == null || !val.contains('@')
                          ? 'Enter an email address'
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: 'Enter password'),
                      validator: (val) => val!.length < 6
                          ? 'Enter a password of at least 6 chars'
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final user =
                              await AuthService().signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (user != null) {}
                        }
                      },
                      child: const Text('Sign In'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
