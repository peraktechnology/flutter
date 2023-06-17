import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  bool _isDarkTheme = true;

  ThemeMode currentTheme() {
    return _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(color: Colors.black),
    accentColor: Colors.white,
    cardColor: const Color(0xFF1A191D),
    brightness: Brightness.dark,
    dividerColor: Colors.grey[600],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueAccent,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFeeeeee),
    accentColor: Colors.black,
    primaryColor: const Color(0xFFeeeeee),
    appBarTheme: const AppBarTheme(color: Color(0xFFeeeeee)),
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueAccent,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}
