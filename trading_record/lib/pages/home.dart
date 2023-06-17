import 'package:flutter/material.dart';
import 'package:minhabanca/helper/color.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double banca = storage.read('banca') != null
        ? double.parse(storage.read('banca'))
        : 1500.00;
    double stake = 0.05;
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(56),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              border: Border.all(color: thirdColor, width: 16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Sua banca:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: white,
                      fontSize: 12,
                    )),
              ),
              Text(
                'R\$ ${banca.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: thirdColor,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(6),
                    height: 48,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: secondColor),
                    child: Text(
                      'R\$ ${(banca * stake).toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(6),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: secondColor),
                    child: const Text(
                      '5%',
                      style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Meia stake',
                  style: TextStyle(
                    fontSize: 12,
                    color: white,
                  ),
                ),
                Text(
                  'R\$ ${((banca * stake) / 2).toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: secondColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stake dupla',
                  style: TextStyle(
                    fontSize: 12,
                    color: white,
                  ),
                ),
                Text(
                  'R\$ ${((banca * stake) * 2).toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: secondColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        )
      ],
    );
  }
}
