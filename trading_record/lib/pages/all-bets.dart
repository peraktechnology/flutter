import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:minhabanca/helper/color.dart';
import 'package:minhabanca/helper/routes.dart';

import '../functions.dart';

class AllBetsPage extends StatelessWidget {
  const AllBetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List list = storage.read('bets');
    print(list.length);
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          Map result = json.decode(list[index]);

          return Card(
              margin: const EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          result["modalidade"].toString(),
                          style: const TextStyle(
                              color: mainColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          result["resultado"].toString(),
                          style: const TextStyle(
                              color: grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$ ${result["valor"]},00',
                            style: const TextStyle(
                                color: black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'odd: ${result["odd"]}',
                            style: const TextStyle(
                                color: secondColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResultCompontent('GREEN', green, result["valor"],
                              result["odd"], index),
                          ResultCompontent('RED', red, result["valor"],
                              result["odd"], index),
                          ResultCompontent('1/2GREEN', green, result["valor"],
                              result["odd"], index),
                          ResultCompontent('1/2RED', red, result["valor"],
                              result["odd"], index)
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

class ResultCompontent extends StatefulWidget {
  Color _color;
  String label;
  int value;
  double odd;
  int index;
  ResultCompontent(this.label, this._color, this.value, this.odd, this.index,
      {super.key});

  @override
  State<ResultCompontent> createState() => _ResultCompontentState();
}

class _ResultCompontentState extends State<ResultCompontent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addBet(widget.label, widget.value, widget.odd, widget.index);
        simpleRoute(context, '/');
      },
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: widget._color, borderRadius: BorderRadius.circular(50)),
          ),
          Text(
            widget.label,
            style: TextStyle(color: widget._color, fontSize: 12),
          )
        ],
      ),
    );
  }
}
