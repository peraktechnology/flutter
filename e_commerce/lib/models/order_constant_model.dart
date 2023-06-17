const String collectionUtils='Utils';
const String documentOrderConstants = 'OrderConstants';
const String orderConFieldDiscount='discount';
const String orderConFieldVat='vat';
const String orderConFieldDeliCharge='deliveryCharge';

class OrderConstantModel{
  num discount;
  num vat;
  num deliveryCharge;

  OrderConstantModel({
   this.discount = 0,
   this.vat = 0,
   this.deliveryCharge = 0,
  });

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      orderConFieldDiscount:discount,
      orderConFieldVat:vat,
      orderConFieldDeliCharge:deliveryCharge,
    };
  }

  factory OrderConstantModel.fromMap(Map<String,dynamic>map)=>OrderConstantModel(
    discount: map[orderConFieldDiscount],
    vat: map[orderConFieldVat],
    deliveryCharge: map[orderConFieldDeliCharge],
  );
}