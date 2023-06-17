
import 'package:ecom_firebase_user_07/pages/checkout_page.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:ecom_firebase_user_07/utils/constant.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:ecom_firebase_user_07/widgets/cart_item_view.dart';
import 'package:ecom_firebase_user_07/widgets/widget_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  static const String routeName='/cart-items';
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('My Cart'),
        actions: [
          TextButton(
      style:TextButton.styleFrom(foregroundColor:Colors.white), onPressed: (){
        Provider.of<CartProvider>(context,listen: false).clearCart();
          }, child: const Text('Clear'))
        ],
      ),

      body:Consumer<CartProvider>(
        builder:(context,provider,child)=> Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.cartList.length,
                itemBuilder:(context,index){
                final cartModel=provider.cartList[index];
                return Dismissible(
                  key: Key(cartModel.productId),
                  background: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text('Remove From Cart', style: TextStyle(color: Colors.white)),
                          Icon(Icons.delete, color: Colors.white,size:30,),
                        ],
                      ),
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async{
                    return await showCustomDailog(title: 'Are you Sure?',
                        content: 'You want to remove this item.',
                        onPressed: () async{
                          await provider.removeFromCart(cartModel.productId);
                          Navigator.pop(context);
                          showMsg(context, 'Removed from Cart ');
                        },
                        positive:'Remove',
                        context: context);
                  },
                  child: CartItemView(cartModel:cartModel,provider:provider,),
                );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SUBTOTAl:$currencySymbol${provider.cartSubtoalPrice()}',style:Theme.of(context).textTheme.headline6,),
                  OutlinedButton(onPressed: (){
                    Navigator.pushNamed(context, CheckoutPage.routeName);
                  }, child:const Text('CHECKOUT'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

