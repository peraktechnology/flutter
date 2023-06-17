import 'package:ecom_firebase_user_07/providers/order_provider.dart';
import 'package:ecom_firebase_user_07/utils/constant.dart';
import 'package:ecom_firebase_user_07/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OrderPage extends StatefulWidget {
  static const String routeName='/orders';
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Your Orders'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context,provider,child){
          final orderItemList=provider.orderItemList;
          return SingleChildScrollView(
            child: Container(
              child: ExpansionPanelList(
                expansionCallback: (index,isExpanded){
                  setState(() {
                    orderItemList[index].isExpanded=!isExpanded;
                  });
                },
                children: orderItemList.map((orderItem) => ExpansionPanel(
                  isExpanded: orderItem.isExpanded,
                    headerBuilder: (context,isExpanded)=>ListTile(
                      title: Text(getFormatedDate(
                        orderItem.orderModel.orderDate.timestamp.toDate(),
                        pattern: 'dd/MM/yyyy HH:mm:ss',
                      )),
                      subtitle: Text(orderItem.orderModel.orderStatus),
                      trailing: Text('$currencySymbol${orderItem.orderModel.grandTotal}'),
                    ),
                    body: Column(
                      children: orderItem.orderModel.productDetails.map((product) => ListTile(
                        title: Text(product.productName),
                        trailing: Text('${product.quantity}X${product.salePrice}'),
                      )).toList(),
                    ))).toList()
              ),
            ),
          );
        },
      ),
    );
  }
}
