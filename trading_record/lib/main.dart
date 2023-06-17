import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minhabanca/helper/color.dart';
import 'package:minhabanca/helper/routes.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (storage.read('bets') == null) {
      storage.write('bets', []);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Banca',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: appRoutes,
      initialRoute: '/',
    );
  }
}
