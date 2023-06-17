
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/models/notification_model.dart';
import 'package:ecom_firebase_user_07/models/order_constant_model.dart';
import 'package:ecom_firebase_user_07/models/order_item_model.dart';
import 'package:ecom_firebase_user_07/models/order_model.dart';
import 'package:flutter/material.dart';
import '../db/db_helper.dart';

class OrderProvider extends ChangeNotifier{
OrderConstantModel orderConstantModel=OrderConstantModel();
List<OrderModel> orderList=[];
List<OrderItem> orderItemList=[];

getOrderConstants() {
  DbHelper.getOrderConstants().listen((snapshot) {
    if(snapshot.exists) {
      orderConstantModel = OrderConstantModel.fromMap(snapshot.data()!);
      notifyListeners();
    }
  });
}

getOdersByUser(){
  DbHelper.getOrdersByUser(AuthService.currentUser!.uid).listen((snapshot) {
    orderList=List.generate(snapshot.docs.length, (index) => OrderModel.fromMap(snapshot.docs[index].data()));
    orderItemList=orderList.map((orderModel) => OrderItem(orderModel: orderModel, isExpanded:false)).toList();
    notifyListeners();
  });
}
Future<void> updateOrderConstants(OrderConstantModel model) {
  return DbHelper.updateOrderConstants(model);
}

 int  getDiscountOnSubtotal(num cartSubtotal) {
  return ((cartSubtotal*orderConstantModel.discount)/100).round();
 }
int  getVatOnSubtotal(num cartSubtotal) {
  return ((cartSubtotal*orderConstantModel.vat)/100).round();
}

 int  grandTotal(num cartSubtoalPrice) {

  return ((cartSubtoalPrice-getDiscountOnSubtotal(cartSubtoalPrice))+getVatOnSubtotal(cartSubtoalPrice)+orderConstantModel.deliveryCharge).round();
 }

  Future<void>saveOrder(OrderModel orderModel) async{
    await DbHelper.saveOrder(orderModel);
    return DbHelper.clearCart(orderModel.userId, orderModel.productDetails);
  }




}