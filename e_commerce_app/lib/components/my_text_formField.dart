import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {

  final name;
  final type;
  final controller;
  bool isPassword = false;
  Icon preIcon;
  IconButton? sufIcon;
  final focusNode;
  final function;




  MyTextFormField({required this.name,required this.controller, required this.isPassword,required this.preIcon,required this.type,this.sufIcon,required this.focusNode,required this.function,});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      obscureText: widget.isPassword,
      focusNode:widget.focusNode ,
      onFieldSubmitted:widget.function ,
      controller:widget.controller ,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff214eff))
        ),
        prefixIcon:widget.preIcon ,
        suffixIcon: widget.sufIcon,
        hintText: widget.name,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      ),
    );
  }
}
