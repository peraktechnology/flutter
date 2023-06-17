import 'package:flutter/material.dart';
import 'package:minhabanca/pages/add-bet.dart';
import 'package:minhabanca/pages/root.dart';

final appRoutes = {
  '/': (context) => RootPage(),
  '/add': (context) => const AddBetPage(),
};

//FUNCTIONS

simpleRoute(context, String route) {
  return Navigator.pushNamed(context, route);
}

constructRoute(context, Widget route) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}
