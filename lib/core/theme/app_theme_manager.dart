import 'package:flutter/material.dart';

class AppThemeManager {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryDarkColor = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF242424),
      ),
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 13,
        fontWeight: FontWeight(800),
      ),
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: Color(0xFF242424), size: 35),
      selectedItemColor: Color(0xFF242424),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF242424),
      ),
      bodyLarge: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 25,
        fontWeight: FontWeight(600),
        color: Color(0xFF242424),
      ),
      bodyMedium: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 25,
        fontWeight: FontWeight(400),
        color: Color(0xFF242424),
      ),
      bodySmall: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 20,
        fontWeight: FontWeight(400),
        color: Color(0xFF242424),
      ),
    ),
    dividerTheme: const DividerThemeData(color: primaryColor, space: 10),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141A2E),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 13,
        fontWeight: FontWeight(800),
        color: primaryDarkColor,
      ),
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: primaryDarkColor, size: 35),
      selectedItemColor: primaryDarkColor,
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 25,
        fontWeight: FontWeight(600),
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 25,
        fontWeight: FontWeight(400),
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 20,
        fontWeight: FontWeight(400),
        color: Colors.white,
      ),
    ),
    dividerTheme: const DividerThemeData(color: primaryDarkColor, space: 10),
  );
}
