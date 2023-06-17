


import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/db/db_helper.dart';
import 'package:ecom_firebase_user_07/models/comment_model.dart';
import 'package:ecom_firebase_user_07/models/product_model.dart';
import 'package:ecom_firebase_user_07/models/rating_model.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';


class ProductProvider extends ChangeNotifier{
  List<CategoryModel> categorList=[];
  List<ProductModel> productList=[];



  getAllProducts(){
    DbHelper.getAllProducts().listen((snapshot) {
      productList = List.generate(snapshot.docs.length, (index) =>
          ProductModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllCategoies(){
     DbHelper.getAllCategories().listen((snapshot) {
      categorList=List.generate(snapshot.docs.length, (index) =>CategoryModel.fromMap(snapshot.docs[index].data()));
      categorList.sort((model1,model2)=>model1.categoryName.compareTo(model2.categoryName));
      notifyListeners();
    });
  }


  getAllProductsByCategory(String categoryName){
  DbHelper.getAllProductsByCategory(categoryName).listen((snapshot) {
      productList = List.generate(snapshot.docs.length, (index) =>
          ProductModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

 Future <List<CommentModel>> getAllCommentsByProductId(String productId) async{
    final snapshot=await DbHelper.getAllCommentsByProductId(productId);
    final commentList = List.generate(snapshot.docs.length, (index) =>
        CommentModel.fromMap(snapshot.docs[index].data()));
    return commentList;
  }


  List<CategoryModel> filteringCategory(){
    return <CategoryModel>[
      CategoryModel(categoryName: 'All'),
      ...categorList
    ];
  }

Future<void>addProductRatings(String productId,double rating,UserModel userModel) async{
    //add Rating to product------------
    final ratings=RatingModel(
        ratingId: AuthService.currentUser!.uid,
        userModel: userModel,
        productId: productId,
        rating: rating);
    await DbHelper.addProductRatings(ratings);
    //get all  Ratings of this product------------
    final snapshot=await DbHelper.getAllRatingsByProductId(productId);

    //calculate average Ratings of this product------------
    final ratingList=List.generate(snapshot.docs.length, (index) =>RatingModel.fromMap(snapshot.docs[index].data()));
    double total=0.0;
    for(var ratingModel in ratingList){
      total+=ratingModel.rating;
    }
    //add average  Ratings of this product------------
    final avgRating=total/ratingList.length;
    return productFieldUpdate(ratings.productId, productFieldAvgRating, avgRating);
}



  Future<void> productFieldUpdate(String productId,String field, dynamic value){
    return DbHelper.productFieldUpdate(productId, {field:value});
  }



  double priceAfterDiscount(num salePrice, num productDiscount) {
    final discountPrice=(salePrice*productDiscount)/100;
    return salePrice-discountPrice;
  }

  Future<void> addComments(CommentModel commentModel) {
  return DbHelper.addComment(commentModel);
  }







}