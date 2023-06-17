import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglive/providers/user_provider.dart';
import 'package:shoppinglive/resources/google_sign_in.dart';
import 'package:shoppinglive/screens/business/businessfollower.dart';
import 'package:shoppinglive/screens/business/businessfollower_profile.dart';
import 'package:shoppinglive/screens/business/businnes_profile_live.dart';
import 'package:shoppinglive/screens/home_screen.dart';
import 'package:shoppinglive/screens/notification_screen.dart';
import 'package:shoppinglive/screens/profile/editprofile/edit_profile.dart';
import 'package:shoppinglive/screens/profile/follower/follower_profile.dart';
import 'package:shoppinglive/screens/profile/myorder/order_section.dart';
import 'package:shoppinglive/screens/profile/profile_screen.dart';
import 'package:shoppinglive/screens/authentication/signup_screen.dart';
import 'package:shoppinglive/screens/authentication/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Shopping Live',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            ProfileScreen.routeName: (context) => const ProfileScreen(),
            FollowerProfile.routeName: (context) => const FollowerProfile(),
            OrderSection.routeName: (context) => const OrderSection(),
            EditProfile.routeName: (context) => const EditProfile(),
            NotificationScreen.routeName: (context) =>
                const NotificationScreen(),
            BusinessLiveScreen.routeName: (context) =>
                const BusinessLiveScreen(),
            BusinessFollower.routeName: (context) => const BusinessFollower(),
          },
          home: const SplashScreen(),
        ),
      );
}
