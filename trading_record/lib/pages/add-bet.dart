import 'package:flutter/material.dart';
import 'package:minhabanca/helper/color.dart';
import 'package:minhabanca/helper/routes.dart';

import '../functions.dart';

class AddBetPage extends StatefulWidget {
  const AddBetPage({super.key});

  @override
  State<AddBetPage> createState() => _AddBetPageState();
}

class _AddBetPageState extends State<AddBetPage> {
  TextEditingController _odd = TextEditingController();
  TextEditingController _valor = TextEditingController();
  String? selectedModalidade = null;
  String? selectedResult = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: white))
          ],
          centerTitle: true,
          title: const Text('Adicionar Aposta'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Modalidade:',
                      style: TextStyle(color: white),
                    ),
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: thirdColor,
                      ),
                      validator: (value) =>
                          value == null ? "Selecione os campos" : null,
                      value: selectedModalidade,
                      dropdownColor: thirdColor,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedModalidade = newValue!;
                        });
                      },
                      items: dropdownSports),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Odd:',
                    style: TextStyle(color: white),
                  ),
                  TextFormField(
                    style: const TextStyle(color: white),
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    controller: _odd,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Valor:',
                    style: TextStyle(color: white),
                  ),
                  TextFormField(
                    style: const TextStyle(color: white),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: _valor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Status:',
                      style: TextStyle(color: white),
                    ),
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: thirdColor,
                      ),
                      validator: (value) =>
                          value == null ? "Select a country" : null,
                      value: selectedResult,
                      dropdownColor: thirdColor,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedResult = newValue!;
                        });
                      },
                      items: dropdownResults),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    List betList = storage.read('bets');
                    betList.add(
                        '{"modalidade": "$selectedModalidade","odd": ${_odd.text},"valor": ${_valor.text},"resultado": "$selectedResult"}');
                    print('object $betList');
                    storage.write('bets', betList);
                    simpleRoute(context, '/');
                    print(betList.length);
                    if (selectedResult != 'ANDAMENTO') {
                      addBet(selectedResult!, int.parse(_valor.text),
                          double.parse(_odd.text), (betList.length - 1));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Submit"),
                  )),
            )
          ],
        ));
  }
}

List<DropdownMenuItem<String>> get dropdownSports {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("Futebol", style: TextStyle(color: white)),
        value: "Futebol"),
    DropdownMenuItem(
        child: Text("Basquete", style: TextStyle(color: white)),
        value: "Basquete"),
    DropdownMenuItem(
        child: Text("FIFA", style: TextStyle(color: white)), value: "FIFA"),
    DropdownMenuItem(
        child: Text("e-Sport", style: TextStyle(color: white)),
        value: "e-Sport")
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownResults {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text("GREEN", style: TextStyle(color: green)), value: "GREEN"),
    DropdownMenuItem(
        child: Text("METADE/GREEN", style: TextStyle(color: green)),
        value: "METADE/GREEN"),
    DropdownMenuItem(
        child: Text("RED", style: TextStyle(color: red)), value: "RED"),
    DropdownMenuItem(
        child: Text("METADE/RED", style: TextStyle(color: red)),
        value: "METADE/RED"),
    DropdownMenuItem(
        child: Text("PUSH", style: TextStyle(color: grey)), value: "PUSH"),
    DropdownMenuItem(
        child: Text("ANDAMENTO", style: TextStyle(color: grey)),
        value: "ANDAMENTO")
  ];
  return menuItems;
}
