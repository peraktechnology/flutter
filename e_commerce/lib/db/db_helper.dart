

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_firebase_user_07/models/cart_model.dart';
import 'package:ecom_firebase_user_07/models/category_model.dart';
import 'package:ecom_firebase_user_07/models/comment_model.dart';
import 'package:ecom_firebase_user_07/models/notification_model.dart';
import 'package:ecom_firebase_user_07/models/order_constant_model.dart';
import 'package:ecom_firebase_user_07/models/order_model.dart';
import 'package:ecom_firebase_user_07/models/product_model.dart';
import 'package:ecom_firebase_user_07/models/rating_model.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';

class DbHelper {
  static const String collectionAdmin = 'Admins';
  static final _db = FirebaseFirestore.instance;

  static Future<bool> doesUserExist(String uid) async {
    final snapshot = await _db.collection(collectionUser).doc(uid).get();
    return snapshot.exists;
  }




  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() =>
      _db.collection(collectionProduct).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories() =>
      _db.collection(collectionCategory).snapshots();



  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllProductsByCategory(String categoryName) =>
      _db.collection(collectionProduct)
          .where('$productFieldCategory.$categoryFieldName', isEqualTo: categoryName)
          .snapshots();

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllRatingsByProductId(String productId) =>
      _db.collection(collectionProduct)
          .doc(productId)
          .collection(collectionRating)
          .get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCartItemsByUser(String uid) =>
      _db.collection(collectionUser)
          .doc(uid)
          .collection(collectionCart)
          .snapshots();


  static Stream<QuerySnapshot<Map<String, dynamic>>> getOrdersByUser(String uid) =>
      _db.collection(collectionOrder).where(orderFieldUserId,isEqualTo:uid).snapshots();


  static Future<QuerySnapshot<Map<String, dynamic>>> getAllCommentsByProductId(String productId) =>
      _db.collection(collectionProduct)
          .doc(productId)
          .collection(collectionComment)
          .where(commentFieldApproved,isEqualTo:true)
          .get();


     static Future<void> productFieldUpdate(String productId,Map<String,dynamic> map){
        return _db.collection(collectionProduct).doc(productId).update(map);
      }

  static Future<void> userProfileUpdate(String uid,Map<String,dynamic> map){
    return _db.collection(collectionUser).doc(uid).update(map);
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getOrderConstants() =>
      _db.collection(collectionUtils).doc(documentOrderConstants).snapshots();


  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(String uid) =>
      _db.collection(collectionUser).doc(uid).snapshots();


  static Future<void> updateOrderConstants(OrderConstantModel model) {
    return _db.collection(collectionUtils)
        .doc(documentOrderConstants)
        .update(model.toMap());
  }

  static Future<void> addUser(UserModel user){
    return  _db.collection(collectionUser)
        .doc(user.userId)
        .set(user.toMap());
  }

  static Future<void> addProductRatings(RatingModel ratingModel){
    return _db.collection(collectionProduct).doc(ratingModel.productId)
        .collection(collectionRating).doc(ratingModel.userModel.userId)
        .set(ratingModel.toMap());
  }

  static Future<void> addComment(CommentModel commentModel){
    final doc=_db
        .collection(collectionProduct)
        .doc(commentModel.productId)
        .collection(collectionComment)
        .doc();
        commentModel.commentId=doc.id;
        return doc.set(commentModel.toMap());
  }

  static Future<void> addToCart(String uid, CartModel cartModel) {

       return  _db
        .collection(collectionUser)
        .doc(uid)
        .collection(collectionCart)
        .doc(cartModel.productId)
           .set(cartModel.toMap());
  }

  static Future<void> removeFromCart(String uid, String productId) {
    return _db.collection(collectionUser).doc(uid)
        .collection(collectionCart).doc(productId).delete();
  }

  static Future<void> updateCartQuantity(String uid, CartModel cartModel) {
    return _db.collection(collectionUser).doc(uid)
        .collection(collectionCart).doc(cartModel.productId).set(cartModel.toMap());
  }

  static Future<void> clearCart(String uid, List<CartModel> cartList) {
    final wb=_db.batch();
    for (final cartItem in cartList){
      final doc=_db.collection(collectionUser).doc(uid).collection(collectionCart).doc(cartItem.productId);
      wb.delete(doc);
    }
    return wb.commit();
  }

  static Future<void> saveOrder(OrderModel orderModel) async{
    final wb=_db.batch();
    final orderdoc=_db.collection(collectionOrder).doc(orderModel.orderId);
    wb.set(orderdoc, orderModel.toMap());
    for(final cartModel in orderModel.productDetails){
      final snapshotProduct= await _db.collection(collectionProduct).doc(cartModel.productId).get();
      final productModel=ProductModel.fromMap(snapshotProduct.data()!);
      final snapshotCategory=await _db.collection(collectionCategory).doc(productModel.category.categoryId).get();
      final categoryModel=CategoryModel.fromMap(snapshotCategory.data()!);
      final newStock=productModel.stock-cartModel.quantity;
      final newCategoryStockCount=categoryModel.productCount-cartModel.quantity;
      final productDoc=_db.collection(collectionProduct).doc(cartModel.productId);
      final categoryDoc=_db.collection(collectionCategory).doc(productModel.category.categoryId);
      wb.update(productDoc, {productFieldStock:newStock});
      wb.update(categoryDoc, {categoryFieldProductCount:newCategoryStockCount});
    }
    final userDoc=_db.collection(collectionUser).doc(orderModel.userId);
    wb.update(userDoc, {userFieldAddressModel:orderModel.deliveryAddress.toMap()});
   return wb.commit();

  }

  static Future<void> addNotification(NotificationModel notification) {
    return _db.collection(collectionNotification).doc(notification.notificationId).set(notification.toMap());
  }




}