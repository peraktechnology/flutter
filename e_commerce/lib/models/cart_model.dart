const String collectionCart = 'Cart';

const String cartFieldProductId = 'productId';
const String cartFieldProductName = 'productName';
const String cartFieldProductImageUrl = 'productImageUrl';
const String cartFieldQuantity = 'quantity';
const String cartFieldSalePrice = 'salePrice';

class CartModel {
  String productId;
  String productName;
  String productImageUrl;
  num quantity;
  num salePrice;

  CartModel(
      {required this.productId,
      required this.productName,
      required this.productImageUrl,
      this.quantity = 1,
      required this.salePrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      cartFieldProductId: productId,
      cartFieldProductName: productName,
      cartFieldProductImageUrl: productImageUrl,
      cartFieldQuantity: quantity,
      cartFieldSalePrice: salePrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
        productId: map[cartFieldProductId],
        productName: map[cartFieldProductName],
        productImageUrl: map[cartFieldProductImageUrl],
        quantity: map[cartFieldQuantity],
        salePrice: map[cartFieldSalePrice],
      );
}
