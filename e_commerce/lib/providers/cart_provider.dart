
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/db/db_helper.dart';
import 'package:ecom_firebase_user_07/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{

  List<CartModel> cartList=[];


  getCartItemsByUser(){
    DbHelper.getCartItemsByUser(AuthService.currentUser!.uid).listen((snapshot) {
      cartList = List.generate(snapshot.docs.length, (index) =>
          CartModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }


  Future<void> addToCart({
  required String productId,
  required String productName,
  required String url,
  required num salePrice,
}){
    final cartModel=CartModel(productId: productId, productName: productName,
        productImageUrl: url, salePrice: salePrice);
    return DbHelper.addToCart(AuthService.currentUser!.uid,cartModel);
  }

  num priceWithQuantity(CartModel cartModel)=>cartModel.quantity*cartModel.salePrice;

  num cartSubtoalPrice(){
    num total=0;
    for(final cartModel in cartList){
      total+=priceWithQuantity(cartModel);
    }
    return total;
  }

  bool productInCart(String productId){
    bool tag=false;
    for(var cart in cartList){
      if(cart.productId==productId){
        tag=true;
        break;
      }
    }
    return tag;
  }

  Future<void>removeFromCart(String productId) {
    return DbHelper.removeFromCart(AuthService.currentUser!.uid,productId);
  }

  void decreaseCartQuantity(CartModel cartModel) {
    if(cartModel.quantity>1){
      cartModel.quantity-=1;
      DbHelper.updateCartQuantity(AuthService.currentUser!.uid,cartModel);
    }
  }

  void increaseCartQuantity(CartModel cartModel) {
    cartModel.quantity+=1;
    DbHelper.updateCartQuantity(AuthService.currentUser!.uid,cartModel);
  }

  Future<void> clearCart() {
       return  DbHelper.clearCart(AuthService.currentUser!.uid,cartList);
  }


}