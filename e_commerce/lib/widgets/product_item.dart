
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_firebase_user_07/models/product_model.dart';
import 'package:ecom_firebase_user_07/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import '../utils/constant.dart';
import '../utils/helper_functions.dart';

class ProductItem extends StatelessWidget {
  ProductModel productModel;
  ProductItem({Key? key,required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:(){
      Navigator.pushNamed(context, ProductDetails.routeName,arguments:productModel);
    },
        child: Card(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: productModel.thumbnailImageModel.imageDownloadUrl,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                    child:Text(productModel.productName,style:TextStyle(color:Colors.grey,fontSize:16),),
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: productModel.avgRating.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures:true,
                        itemSize:15,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text('(${productModel.avgRating.toStringAsFixed(1)})')
                    ],
                  ),
                  if(productModel.productDiscount>0)Padding(padding: EdgeInsets.all(8.0),
                    child:RichText(
                      text:TextSpan(
                        text:'$currencySymbol${priceAfterDiscount(productModel.salePrice,productModel.productDiscount)}',
                        style:TextStyle(color:Colors.black,fontSize: 20),
                        children: [
                          TextSpan(
                              text:' $currencySymbol${productModel.salePrice}',
                              style:const TextStyle(color:Colors.red,fontSize:16,decoration:TextDecoration.lineThrough)),
                        ],

                      ),

                    ),
                  ),
                  if(productModel.productDiscount==0) Padding(padding: EdgeInsets.all(8.0),
                    child:Text('$currencySymbol${(productModel.salePrice).toStringAsFixed(0)}',style:TextStyle(color:Colors.black,fontSize:20),),
                  ),
                ],

              ),

              if(productModel.productDiscount>0)Positioned(
                top:10, right: 10,
                  child:Stack(
                    alignment:Alignment.center,
                    children: [
                      Container(
                        height:50,
                        width: 50,
                        decoration:BoxDecoration(
                            color:Colors.red,
                            borderRadius:BorderRadius.circular(30)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              '${productModel.productDiscount}%',
                              style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold),),
                            Text(
                              'off',
                              style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],

                  )),
            ],
          ),
        )
    );
  }
}
