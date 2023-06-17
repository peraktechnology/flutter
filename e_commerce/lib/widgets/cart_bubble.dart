
import 'package:ecom_firebase_user_07/pages/cart_tems.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBubble extends StatelessWidget {

  const CartBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.pushNamed(context, CartItems.routeName);
    },
      child:Stack(
        children: [
        const   Padding(
            padding:  EdgeInsets.all(16.0),
            child:  Icon(
                Icons.shopping_cart,
              size: 30,
            ),
          ),
          Positioned(
            right: 5,
              top: 5,
              child:Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment:Alignment.center,
                  height: 20,
                  width: 20,
                  decoration:const BoxDecoration(
                    color:Colors.red,
                    shape:BoxShape.circle
                  ),
                  child: FittedBox(child:
                  Consumer<CartProvider>(builder:(context,provider,child)=> Text(provider.cartList.length.toString()))
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
