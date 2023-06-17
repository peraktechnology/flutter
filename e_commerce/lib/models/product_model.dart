 import 'package:ecom_firebase_user_07/models/category_model.dart';

import 'image_model.dart';
const String collectionProduct='Products';
 const String productFieldId='productId';
 const String productFieldName='productName';
 const String productFieldCategory='category';
 const String productFieldShortDescription='shortDescription';
 const String productFieldLongDescription='longDescription';
 const String productFieldSalePrice='salePrice';
 const String productFieldStock='stock';
 const String productFieldAvgRating='avgRating';
 const String productFieldDiscount='discount';
 const String productFieldThumbnail='thumbnail';
 const String productFieldImages='images';
 const String productFieldAvailable='available';
 const String productFieldFeatured='featured';


class ProductModel{

  String? productId;
  String productName;
  CategoryModel category;
  String? shortDescription;
  String? longDescription;
  num salePrice;
  num stock;
  num avgRating;
  num productDiscount;
  ImageModel thumbnailImageModel;
  List<String> additionalImageModels;
  bool available;
  bool featured;

  ProductModel({
      this.productId,
      required this.productName,
      required this.category,
      this.shortDescription,
      this.longDescription,
      required this.salePrice,
      required this.stock,
      this.avgRating = 0.0,
      this.productDiscount = 0,
      required this.thumbnailImageModel,
      required this.additionalImageModels,
      this.available=true,
      this.featured=false,
  });

  Map<String,dynamic>toMap(){
    return <String,dynamic>{
      productFieldId:productId,
      productFieldName : productName,
      productFieldCategory:category.toMap(),
      productFieldShortDescription:shortDescription,
      productFieldLongDescription:longDescription,
      productFieldSalePrice:salePrice,
      productFieldStock:stock,
      productFieldAvgRating:avgRating,
      productFieldDiscount:productDiscount,
      productFieldThumbnail:thumbnailImageModel.toMap(),
      productFieldImages: additionalImageModels,
      productFieldAvailable:available,
      productFieldFeatured:featured,

    };
  }

  factory ProductModel.fromMap(Map<String,dynamic>map)=>ProductModel(
      productId: map[productFieldId],
      productName: map[productFieldName],
      category: CategoryModel.fromMap(map[productFieldCategory]),
      shortDescription:map[productFieldShortDescription],
      longDescription:map[productFieldLongDescription],
      salePrice:  map[productFieldSalePrice],
      stock:  map[productFieldStock],
      avgRating:  map[productFieldAvgRating],
      productDiscount:map[productFieldDiscount],
      thumbnailImageModel: ImageModel.fromMap(map[productFieldThumbnail]),
      additionalImageModels: (map[productFieldImages] as List).map((e) => e as String).toList(),
      available: map[productFieldAvailable],
      featured: map[productFieldFeatured],
  );



}