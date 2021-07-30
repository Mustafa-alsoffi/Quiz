import 'package:flutter/material.dart';

enum MyThemeKeys {BLACK, RED, GREEN, YELLOW, BLUE}

class MyThemes {

  static final ThemeData black = ThemeData(primaryColor: Colors.black,);
  static final ThemeData red = ThemeData(primaryColor: Colors.red,);
  static final ThemeData green = ThemeData(primaryColor: Colors.green,);
  static final ThemeData yellow = ThemeData(primaryColor: Colors.yellow,);
  static final ThemeData blue = ThemeData(primaryColor: Colors.blue,);

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.BLACK:
        return black;
      case MyThemeKeys.RED:
        return red;
      case MyThemeKeys.GREEN:
        return green;
      case MyThemeKeys.YELLOW:
        return yellow;
      default:
        return blue;
    }
  }
}