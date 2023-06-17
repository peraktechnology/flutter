import 'package:flutter/material.dart';
import '../helper/color.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextFormField(
            controller: _controller,
          ),
        ),
        TextButton(
            onPressed: () {
              storage.write('banca', _controller.text);
            },
            child: const Text("atualizar banca"))
      ],
    );
  }
}
