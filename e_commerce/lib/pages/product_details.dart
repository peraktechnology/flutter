

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/models/comment_model.dart';
import 'package:ecom_firebase_user_07/models/notification_model.dart';
import 'package:ecom_firebase_user_07/models/product_model.dart';
import 'package:ecom_firebase_user_07/pages/login.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:ecom_firebase_user_07/providers/notification_provider.dart';
import 'package:ecom_firebase_user_07/providers/product_provider.dart';
import 'package:ecom_firebase_user_07/providers/user_provider.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:ecom_firebase_user_07/widgets/cart_bubble.dart';
import 'package:ecom_firebase_user_07/widgets/widget_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../utils/constant.dart';


class ProductDetails extends StatefulWidget {
  static const String routeName='/product-details';
  ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductModel productModel;
    late ProductProvider productProvider;
    late UserProvider userProvider;
  late NotificationProvider notificationProvider;
    String photoUrl='';
    double userRating=0.0;
    final commentController=TextEditingController();
    final focusNode=FocusNode();
    @override
  void didChangeDependencies() {
      productModel=ModalRoute.of(context)!.settings.arguments as ProductModel;
      productProvider=Provider.of<ProductProvider>(context,listen: false);
      userProvider=Provider.of<UserProvider>(context,listen: false);
      notificationProvider=Provider.of<NotificationProvider>(context,listen:false);
      photoUrl=productModel.thumbnailImageModel.imageDownloadUrl;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title:Text(productModel.productName),
        actions: [
          CartBubble()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:5),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          photoUrl=productModel.thumbnailImageModel.imageDownloadUrl;
                        });
                      },
                      child: CachedNetworkImage(
                        height:80,
                        width:70,
                        fit: BoxFit.cover,
                        imageUrl: productModel.thumbnailImageModel.imageDownloadUrl,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>const  Icon(Icons.error),
                      ),
                    ),
                    ...productModel.additionalImageModels.map((url){
                      return url.isEmpty? const Card(
                          child: SizedBox(
                              height:80,
                              width:70,
                              child: Icon(Icons.image)))
                          :InkWell(
                        onTap: (){
                          setState(() {
                            photoUrl=url;
                          });
                        },
                        child: Card(
                          child: CachedNetworkImage(
                            height:80,
                            width:70,
                            fit: BoxFit.cover,
                            imageUrl: url,
                            placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ) ,
                        ),
                      );
                    }).toList()

                  ],
                ),
                Expanded(
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl:photoUrl,
                    placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>const  Icon(Icons.error),
                  ),
                ),
              ],
            ),
            Card(
              child: Row(
                children: [
                  Expanded(child: Consumer<CartProvider>(builder:(context, provider,child){
                    final productInCart=provider.productInCart(productModel.productId!);
                    return TextButton.icon(onPressed:() async{
                      if(productInCart){

                        await provider.removeFromCart(productModel.productId!);
                        showMsg(context, 'Removed from Cart ');
                      }else{
                        EasyLoading.show(status:'Please Wait..');
                          await provider.addToCart(productId: productModel.productId!,
                            productName: productModel.productName,
                            url: productModel.thumbnailImageModel.imageDownloadUrl,
                            salePrice: num.parse(priceAfterDiscount(productModel.salePrice, productModel.productDiscount)));
                          EasyLoading.dismiss();
                          showMsg(context, 'Added to Cart ');
                      }
                    } ,icon: productInCart?Icon(Icons.remove_shopping_cart):Icon(Icons.shopping_cart,color:Theme.of(context).primaryColor,),label:Text(productInCart?'Remove form Cart':'Add to Cart') ,);
                  })),
                  Expanded(child: TextButton.icon(onPressed:(){} ,icon: Icon(Icons.favorite,color:Theme.of(context).primaryColor,),label:Text('Add to Favorite') ,)),
                ],
              ),
            ),

            ListTile(
              title:Text(productModel.productName),
              subtitle:Text(productModel.category.categoryName),
            ),
            ListTile(
              title:Text('$currencySymbol ${productModel.salePrice}'),
              subtitle:Text('Discount: ${productModel.productDiscount}%'),
              trailing:Text('$currencySymbol ${productProvider.priceAfterDiscount(productModel.salePrice,productModel.productDiscount)}'),
            ),
            Card(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  const Text('Rate this product',style:TextStyle(fontSize:20),),
                  RatingBar.builder(
                    initialRating: productModel.avgRating.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures:false,
                    itemPadding:const  EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) =>  const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                     setState(() {
                       userRating=rating;
                     });
                    },
                  ),
                  OutlinedButton(onPressed: () async{
                    if(AuthService.currentUser!.isAnonymous){
                      showCustomDailog(
                          title: 'Unregistered User !',
                          content: 'Plese register with email and password or Login with google account ',
                          positive: 'Login',
                          onPressed: (){
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          context: context);
                    }else{
                      EasyLoading.show(status: 'Please wait....');
                      await productProvider.addProductRatings(
                          productModel.productId!,
                          userRating,
                          userProvider.userModel!
                      );
                      EasyLoading.dismiss();
                      showMsg(context,'Thanks for your rating');
                    }
                  }, child: const Text('Submit'))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:Text('Comments',style:Theme.of(context).textTheme.headline5,),
            ),
            Card(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  const Text('Add Your Comments',),
                  TextField(
                    maxLines: 3,
                    focusNode: focusNode,
                    controller: commentController,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                  OutlinedButton(onPressed: () async{
                    if(AuthService.currentUser!.isAnonymous){
                      showCustomDailog(
                          title: 'Unregistered User !',
                          content: 'Plese register with email and password or Login with google account ',
                          positive: 'Login',
                          onPressed: (){
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          context: context);
                    }else{
                      EasyLoading.show(status: 'Please wait....');

                      final commentModel=CommentModel(userModel: userProvider.userModel!,
                          productId:  productModel.productId!,
                          comment: commentController.text,
                          date: getFormatedDate(DateTime.now(),pattern:'dd/MM/yyyy'));
                      await productProvider.addComments(commentModel);
                      final notification=NotificationModel(
                          notificationId: DateTime.now().millisecondsSinceEpoch.toString(),
                          type: NotificationType.comment,
                          message:'You have new comment on #${productModel.productName} waiting for your Approval',
                          commentModel: commentModel
                      );
                      await notificationProvider.addNotification(notification);
                      EasyLoading.dismiss();
                      if(mounted ) showMsg(context,'Thanks for your comments wait for approval');
                      _resetComment();
                      focusNode.unfocus();
                    }
                  }, child: const Text('Submit'))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child:Text('All Comments',style:Theme.of(context).textTheme.headline5,),
            ),
            FutureBuilder(
                future: productProvider.getAllCommentsByProductId(productModel.productId!),
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    final commentList=snapshot.data!;
                    if(commentList.isEmpty){
                      return const Center(child:Text('No Comments Yet'),);
                    }else{
                      return Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:commentList.map((comment) =>ListTile(
                          leading: comment.userModel.userPhotoUrl==null?Icon(Icons.person):CachedNetworkImage(
                            height:50,
                            width:50,
                            fit: BoxFit.cover,
                            imageUrl:comment.userModel.userPhotoUrl!,
                            placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>const  Icon(Icons.error),
                          ),
                          title: Text(comment.userModel.displayName?? comment.userModel.email),
                          subtitle: Text(comment.comment),
                          trailing:Text(comment.date) ,
                        )).toList(),
                      );
                    }
                  }
                  if(snapshot.hasError){

                  }
                  return const Center(child:Text('Loading...'),);
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
   commentController.dispose();
    super.dispose();
  }

  _resetComment(){
      commentController.clear();
  }


}
