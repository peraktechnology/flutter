
import 'package:ecom_firebase_user_07/pages/cart_tems.dart';
import 'package:ecom_firebase_user_07/pages/checkout_page.dart';
import 'package:ecom_firebase_user_07/pages/launcher.dart';
import 'package:ecom_firebase_user_07/pages/login.dart';
import 'package:ecom_firebase_user_07/pages/order_page.dart';
import 'package:ecom_firebase_user_07/pages/order_success_page.dart';
import 'package:ecom_firebase_user_07/pages/otp_verification.dart';
import 'package:ecom_firebase_user_07/pages/product_details.dart';
import 'package:ecom_firebase_user_07/pages/user_profile_page.dart';
import 'package:ecom_firebase_user_07/pages/view_product_page.dart';
import 'package:ecom_firebase_user_07/providers/cart_provider.dart';
import 'package:ecom_firebase_user_07/providers/notification_provider.dart';
import 'package:ecom_firebase_user_07/providers/order_provider.dart';
import 'package:ecom_firebase_user_07/providers/product_provider.dart';
import 'package:ecom_firebase_user_07/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (context)=>ProductProvider()),
      ChangeNotifierProvider(create: (context)=>OrderProvider()),
      ChangeNotifierProvider(create: (context)=>UserProvider()),
      ChangeNotifierProvider(create: (context)=>CartProvider()),
      ChangeNotifierProvider(create: (context)=>NotificationProvider()),
    ],
      child: const MyApp() ,
    )
     
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.s
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce User',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     builder:EasyLoading.init(),
     initialRoute:Launcher.routeName,
     routes: {
       Launcher.routeName:(_)=>Launcher(),
       OrderPage.routeName:(_)=>OrderPage(),
       ViewProductPage.routeName:(_)=>ViewProductPage(),
       LoginPage.routeName:(_)=>LoginPage(),
       ProductDetails.routeName:(_)=>ProductDetails(),
       UserProfile.routeName:(_)=>UserProfile(),
       CartItems.routeName:(_)=>CartItems(),
       CheckoutPage.routeName:(_)=>CheckoutPage(),
       OrderSuccessPage.routeName:(_)=>OrderSuccessPage(),
       OtpVerificationPage.routeName:(_)=>OtpVerificationPage()


     },
    );
  }
}


