import 'package:flutter/material.dart';
import 'package:minhabanca/helper/color.dart';
import 'package:minhabanca/helper/routes.dart';
import 'package:minhabanca/pages/add-bet.dart';
import 'package:minhabanca/pages/all-bets.dart';
import 'package:minhabanca/pages/home.dart';
import 'package:minhabanca/pages/minha-conta.dart';

class RootPage extends StatefulWidget {
  RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> _telas = [AllBetsPage(), HomePage(), MyAccount()];
  int _indiceAtual = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            simpleRoute(context, '/add');
          },
          backgroundColor: mainColor,
          child: const Icon(
            Icons.monetization_on_outlined,
            size: 40,
            color: white,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: mainColor,
          currentIndex: _indiceAtual,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined),
                label: "Minhas apostas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2), label: "Minha Conta"),
          ],
        ),
        body: _telas[_indiceAtual]);
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
