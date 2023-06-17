
import 'package:ecom_firebase_user_07/models/cart_model.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecom_firebase_user_07/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CartItemView extends StatelessWidget {
  final CartModel cartModel;
  final CartProvider provider;

  const  CartItemView({Key? key,required this.cartModel,required this.provider}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    height:80,
                    width:70,
                    fit: BoxFit.cover,
                    imageUrl: cartModel.productImageUrl,
                    placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartModel.productName,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
                   const  SizedBox(height:5,),
                    Text('unit price:$currencySymbol${cartModel.salePrice}',style:const TextStyle(fontWeight:FontWeight.w700),) ,
                  ],
                ),
              ],
            ),


            Column(
              children: [
               const  Text('Quantity'),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        provider.decreaseCartQuantity(cartModel);
                      }, icon:const Icon(Icons.remove_circle,size: 30,),),
                    Text('${cartModel.quantity}',style:const TextStyle(fontWeight:FontWeight.bold)),
                    IconButton(
                      onPressed: (){
                        provider.increaseCartQuantity(cartModel);
                      }, icon:const Icon(Icons.add_circle,size: 30,),)
                  ],
                ),
                Text('Price:$currencySymbol${provider.priceWithQuantity(cartModel)}',style:const TextStyle(fontWeight:FontWeight.w700),) ,
              ],
            ),
          ]
      ),
    );
  }
}
