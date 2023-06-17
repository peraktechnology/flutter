import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ThemeData.light().colorScheme.copyWith(
                  primary: Colors.yellow[700],
                  secondary: Colors.blue[300],
                ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))))),
        home: snapshot.connectionState != ConnectionState.done
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  }
                  if (snapshot.hasData) {
                    return const ChatScreen();
                  }
                  return const AuthScreen();
                }),
              ),
      ),
    );
  }
}
