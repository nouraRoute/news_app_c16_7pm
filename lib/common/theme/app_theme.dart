import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.black,
      secondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: getTextTheme(Colors.black),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    textTheme: getTextTheme(Colors.white),
  );

  static TextTheme getTextTheme(Color color) {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
