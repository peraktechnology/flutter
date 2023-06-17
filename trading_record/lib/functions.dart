import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'helper/color.dart';

void showToast(String label, Color color) {
  Fluttertoast.showToast(
      msg: label,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: color.withOpacity(0.5),
      textColor: white,
      fontSize: 16.0);
}

void addBet(String parameter, int value, double odd, int index) {
  var banca = double.parse(storage.read('banca'));
  var res = 0.0;
  List betList = storage.read('bets');
  switch (parameter) {
    case "GREEN":
      {
        res = value * odd;
        banca += res;
        storage.write('banca', banca.toString());
        betList.removeAt(index);
        storage.write('bets', betList);
        showToast('+ R\$ $res', green);
      }
      break;
    case "RED":
      {
        banca -= value;
        storage.write('banca', banca.toString());
        betList.removeAt(index);
        storage.write('bets', betList);
        showToast('- R\$ $value', red);
      }
      break;
    case "1/2GREEN":
      {
        res = (value * odd) / 2;
        banca += res;
        storage.write('banca', banca.toString());
        betList.removeAt(index);
        storage.write('bets', betList);
        showToast('+ R\$ $res', green);
      }
      break;
    case "1/2RED":
      {
        res = value / 2;
        banca -= res;
        storage.write('banca', banca.toString());
        betList.removeAt(index);
        storage.write('bets', betList);
        showToast('- R\$ $res', green);
      }
      break;
    default:
      {
        betList.removeAt(index);
        storage.write('bets', betList);
        showToast('Devolvido', grey);
      }
  }
}
