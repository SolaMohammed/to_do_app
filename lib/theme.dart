import 'package:flutter/material.dart';

class MyTheme{
  static const Color primaryColor=Color(0xff5D9CEC);
  static const Color grayColor=Color(0xffC8C9CB);
  static const Color greenColor=Color(0xff61E757);
  static const Color redColor=Color(0xffEC4B4B);
  static const Color darkGrayColor=Color(0xff707070);
  static const Color accentColor=Color(0xffDFECDB);
  static const Color darkAccentColor=Color(0xff060E1E);

  static const TextStyle appBarTextStyle= TextStyle(
      fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white
  );
  static const TextStyle bottomSheetBlack= TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black
  );
  static const TextStyle titleTextStyle= TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold,color: primaryColor
  );
  static const TextStyle titleTimeTextStyle= TextStyle(
      fontSize: 12,color: darkGrayColor
  );

  static ThemeData light=ThemeData(
    scaffoldBackgroundColor: accentColor,
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: appBarTextStyle
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: primaryColor,
      size: 33),
      unselectedIconTheme: IconThemeData(color: grayColor,
          size: 33),
    ),
  );
  static ThemeData dark=ThemeData();
}