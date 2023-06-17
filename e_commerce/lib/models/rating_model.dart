

import 'package:ecom_firebase_user_07/models/user_model.dart';

const String collectionRating = 'Rating';
const String ratingFieldId = 'ratingId';
const String ratingFieldUserModel = 'userModel';
const String ratingFieldProductId = 'productId';
const String ratingFieldRating = 'rating';

class RatingModel {
  String ratingId;
  UserModel userModel;
  String productId;
  num rating;

  RatingModel(
      {required this.ratingId,
      required this.userModel,
      required this.productId,
      required this.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ratingFieldId: ratingId,
      ratingFieldUserModel: userModel.toMap(),
      ratingFieldProductId: productId,
      ratingFieldRating: rating,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) => RatingModel(
        ratingId: map[ratingFieldId],
        userModel: UserModel.fromMap(map[ratingFieldUserModel]),
        productId: map[ratingFieldProductId],
        rating: map[ratingFieldRating],
      );
}
