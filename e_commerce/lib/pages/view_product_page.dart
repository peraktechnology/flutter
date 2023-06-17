
import 'package:ecom_firebase_user_07/models/category_model.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:ecom_firebase_user_07/providers/order_provider.dart';
import 'package:ecom_firebase_user_07/providers/product_provider.dart';
import 'package:ecom_firebase_user_07/providers/user_provider.dart';
import 'package:ecom_firebase_user_07/widgets/cart_bubble.dart';
import 'package:ecom_firebase_user_07/widgets/custom_drawer.dart';
import 'package:ecom_firebase_user_07/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewProductPage extends StatefulWidget {
  static const String routeName='/view_product';
  const ViewProductPage({Key? key}) : super(key: key);

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  CategoryModel? categoryModel;

  @override
  void initState() {
    Provider.of<ProductProvider>(context,listen:false).getAllCategoies();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    Provider.of<ProductProvider>(context,listen:false).getAllCategoies();
    Provider.of<ProductProvider>(context,listen:false).getAllProducts();
    Provider.of<OrderProvider>(context,listen:false).getOrderConstants();
    Provider.of<UserProvider>(context,listen:false).getUserInfo();
    Provider.of<CartProvider>(context,listen:false).getCartItemsByUser();
    Provider.of<OrderProvider>(context,listen:false).getOdersByUser();

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('View Products'),
        actions: [
          CartBubble()
        ],
      ),
      drawer:const CustomDrawer(),
      // bottomNavigationBar:Container(
      //   color:Theme.of(context).primaryColor,
      //   child:Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(onPressed: (){
      //         Navigator.pushNamed(context, UserProfile.routeName);
      //       }, icon: Icon(Icons.person,color:Colors.white,)),
      //
      //       IconButton(onPressed: (){
      //         Navigator.pushNamed(context, ViewProductPage.routeName);
      //       }, icon: Icon(Icons.home,color:Colors.white,)),
      //       IconButton(onPressed: (){
      //         Navigator.pushNamed(context, UserProfile.routeName);
      //       }, icon: Icon(Icons.shopping_cart,color:Colors.white,)),
      //
      //     ],
      //   ),
      // ),

      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<CategoryModel>(
                isExpanded: true,
                hint: const Text('Select Category'),
                value: categoryModel,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
                items: provider.filteringCategory()
                    .map((catModel) => DropdownMenuItem(
                  value: catModel,
                  child: Text(catModel.categoryName),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    categoryModel = value;
                  });
                  if(categoryModel!.categoryName == 'All') {
                    provider.getAllProducts();
                  } else {
                    provider.getAllProductsByCategory(categoryModel!.categoryName);
                  }
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  childAspectRatio:0.65
                ),
                itemCount: provider.productList.length,
                itemBuilder: (context, index) {
                  final product = provider.productList[index];
                  return ProductItem(productModel: product);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
