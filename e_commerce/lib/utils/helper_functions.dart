

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

getFormatedDate(DateTime dt,{String pattern='dd/MM/yyyy'}){
  return DateFormat(pattern).format(dt);

}
showMsg(BuildContext context,String msg ){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

Future<bool> isConnectedToInternet() async{
  var result=await (Connectivity().checkConnectivity());
  return result==ConnectivityResult.wifi|| result==ConnectivityResult.mobile;
}

String priceAfterDiscount(num salePrice, num productDiscount) {
  final discountPrice=(salePrice*productDiscount)/100;
  return (salePrice-discountPrice).toStringAsFixed(0);
}

String get getOrderId=>'${getFormatedDate(DateTime.now(),pattern: 'yyyyMMdd_HH:mm:ss')}';


bool isNumeric(String value){
  if (value == null) {
    return false;
  }
  return double.tryParse(value) != null;
}
