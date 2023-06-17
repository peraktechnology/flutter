import 'package:flutter/material.dart';

const kTextFieldContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
  border: InputBorder.none,
  hintStyle: TextStyle(color: Colors.black45),
);
