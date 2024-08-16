import 'package:flutter/material.dart';


final kLightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
        color: Colors.blue
    ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black,fontSize: 25,  ), // Устанавливаем цвет текста для bodyText1
    bodyMedium: TextStyle(color: Colors.black, ), // Устанавливаем цвет текста для bodyText2
    bodySmall: TextStyle(color: Colors.black87, ), // Устанавливаем цвет текста для bodyText2
  ),
  dividerColor: Colors.blue.shade400,
    listTileTheme: ListTileThemeData(iconColor: Colors.blue)

);
final kDarkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
    color: Colors.teal
  ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // Устанавливаем цвет текста для bodyText1
      bodyMedium: TextStyle(color: Colors.white), // Устанавливаем цвет текста для bodyText2
      bodySmall: TextStyle(color: Colors.white60), // Устанавливаем цвет текста для bodyText2
  ),
    dividerColor: Colors.white30,
  listTileTheme: ListTileThemeData(iconColor: Colors.white)

);

