
import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  static const String routeName='/order-success';
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Order Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const Icon(Icons.done,size:150,color:Colors.green,),
           const Text('Your Order Placed',style:TextStyle(fontWeight:FontWeight.bold),),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              },
                child:const Text('Buy More'),
              ),
          ],
        ),
      ),
    );
  }
}
