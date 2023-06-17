
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_firebase_user_07/auth/auth_service.dart';
import 'package:ecom_firebase_user_07/models/address_model.dart';
import 'package:ecom_firebase_user_07/models/date_model.dart';
import 'package:ecom_firebase_user_07/models/notification_model.dart';
import 'package:ecom_firebase_user_07/models/order_model.dart';
import 'package:ecom_firebase_user_07/pages/order_success_page.dart';
import 'package:ecom_firebase_user_07/pages/view_product_page.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:ecom_firebase_user_07/providers/notification_provider.dart';
import 'package:ecom_firebase_user_07/providers/order_provider.dart';
import 'package:ecom_firebase_user_07/providers/user_provider.dart';
import 'package:ecom_firebase_user_07/utils/constant.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName='/checkout';
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  late UserProvider userProvider;
  late CartProvider cartProvider;
  late OrderProvider orderProvider;
  late NotificationProvider notificationProvider;

  final addressLineController = TextEditingController();
  final zipCodeController = TextEditingController();
  String paymentMethodGroupValue = paymentMethod.cod;
  String? city;

  @override
  void didChangeDependencies() {
    orderProvider=Provider.of<OrderProvider>(context);
    cartProvider=Provider.of<CartProvider>(context,listen:false);
    userProvider=Provider.of<UserProvider>(context,listen:false);
    notificationProvider=Provider.of<NotificationProvider>(context,listen:false);
    setAddressIfExist();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    addressLineController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Checkout Page'),
      ),
      body:ListView(
        padding: const EdgeInsets.all(9),
        children: [
            buildHeader('Product Info'),
          buildProduct(),
          buildHeader('Order Summary'),
          buildOrder(),
          buildHeader('Delivery Address'),
          buildAddress(),
          buildHeader('Payment Method'),
          buildPayment(),
          buildOrderButtonSection()

        ],
      )
    );
  }

  Padding buildHeader(String header) {
    return Padding(padding: EdgeInsets.all(8.0),
            child: Text(
              header,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
  }

  Widget buildProduct() {
    return Card(
     child:Padding(
       padding: EdgeInsets.all(8),
       child: Column(
         children: cartProvider.cartList.map((cartProduct) =>ListTile(
           title: Text(cartProduct.productName),
           trailing: Text('${cartProduct.quantity}x$currencySymbol${cartProduct.salePrice}'),
         ) ).toList()
       ),
     ),
    );
  }

 Widget buildOrder() {
    return Card(
      child: Padding(padding: EdgeInsets.all(8),
        child:Column(
          children: [
            ListTile(
              title: const Text('Sub total'),
              trailing: Text('$currencySymbol${cartProvider.cartSubtoalPrice()}'),
            ),
            ListTile(
              title: Text('Discount(${orderProvider.orderConstantModel.discount}%)'),
              trailing: Text('$currencySymbol${orderProvider.getDiscountOnSubtotal(cartProvider.cartSubtoalPrice())}'),
            ),
            ListTile(
              title: Text('Vat(${orderProvider.orderConstantModel.vat}%)'),
              trailing: Text('$currencySymbol${orderProvider.getVatOnSubtotal(cartProvider.cartSubtoalPrice())}'),
            ),
            ListTile(
              title: Text('Delivery Charge)'),
              trailing: Text('$currencySymbol${orderProvider.orderConstantModel.deliveryCharge}'),
            ),
            const Divider(height:4,color:Colors.black,),
            ListTile(
              title:const  Text('Grand Total',style:TextStyle(fontWeight: FontWeight.bold),),
              trailing: Text('$currencySymbol${orderProvider.grandTotal(cartProvider.cartSubtoalPrice())}',style:TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
 }

 Widget buildAddress() {
    return Card(
      child: Padding(padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0),
            child: TextField(
              controller: addressLineController,
              decoration: const InputDecoration(hintText: 'Address Line',border:OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0),
            child: TextField(
              controller: zipCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Zip Code',border:OutlineInputBorder()),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:4.0),
          child: DropdownButton<String>(
            value:city,
              hint: Text('Select your city'),
              isExpanded: true,
              items: cities.map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city))).toList(), onChanged: (value){
              setState(() {
                city=value;
              });

          }),
        )
        ],
      ),),
    );
  }

 Widget buildPayment() {
return Card(
  child: Padding(padding: EdgeInsets.all(8),
  child: Row(
    children: [
      Radio<String>(value: paymentMethod.cod, groupValue:paymentMethodGroupValue, onChanged:(value){
        setState(() {
          paymentMethodGroupValue=value!;
        });
      },),
      const Text('COD'),
      Radio<String>(value: paymentMethod.online, groupValue:paymentMethodGroupValue, onChanged:(value){
        setState(() {
          paymentMethodGroupValue=value!;
        });
      },),
      const Text('Online'),
    ],
  ),),
);
  }

  Widget buildOrderButtonSection() {
    return ElevatedButton(
      onPressed: _saveOrder,
      child: const Text('PLACE ORDER'),
    );
  }
  

  void _saveOrder()  async{
    if(addressLineController.text.isEmpty){
      showMsg(context,'Please Enter Address');
      return;
    }
    if(zipCodeController.text.isEmpty){
      showMsg(context,'Please Enter Zip Code');
      return;
    }
    if(city==null){
      showMsg(context,'Please Select City');
      return;
    }
    EasyLoading.show(status: 'Please Wait');
    final orderModel=OrderModel(
        orderId: getOrderId,
        userId: AuthService.currentUser!.uid,
        orderStatus: orderStatus.pending,
        paymentMethod: paymentMethodGroupValue,
        grandTotal: orderProvider.grandTotal(cartProvider.cartSubtoalPrice()),
        discount: orderProvider.getDiscountOnSubtotal(cartProvider.cartSubtoalPrice()),
        VAT: orderProvider.getVatOnSubtotal(cartProvider.cartSubtoalPrice()),
        deliveryCharge: orderProvider.orderConstantModel.deliveryCharge,
        orderDate: DateModel(
          timestamp: Timestamp.fromDate(DateTime.now()),
          day: DateTime.now().day,
          month: DateTime.now().month,
          year: DateTime.now().year,
        ),
        deliveryAddress: AddressModel(addressLine1: addressLineController.text, city: city, zipcode: zipCodeController.text),
        productDetails: cartProvider.cartList);

    try{
      await orderProvider.saveOrder(orderModel);
      final notification=NotificationModel(
        notificationId: DateTime.now().millisecondsSinceEpoch.toString(),
        type: NotificationType.order,
        message: 'You have  new order #${orderModel.orderId}',
        orderModel:orderModel
      );
      await notificationProvider.addNotification(notification);
      EasyLoading.dismiss();
      if(mounted ) Navigator.pushNamedAndRemoveUntil(context,OrderSuccessPage.routeName, ModalRoute.withName(ViewProductPage.routeName));

    }catch(error){
      EasyLoading.dismiss();
      showMsg(context, 'Failed to save Order');
    }



  }

  void setAddressIfExist() {
    final userModel=userProvider.userModel;
    if(userModel!=null){
      if(userModel.addressModel!=null){
        final addressModel=userModel.addressModel!;
        addressLineController.text=addressModel.addressLine1!;
        zipCodeController.text=addressModel.zipcode!;
        city=addressModel.city;
      }
    }
  }
}
