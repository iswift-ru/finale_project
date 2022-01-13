import 'package:flutter/material.dart';

class ThemeSettings {
  static final ThemeSettings _instance = ThemeSettings._internal();
  bool themeBrightness = false;

  factory ThemeSettings()
  {
    return _instance;
  }

  ThemeSettings._internal();
}


ThemeSettings themeSett = ThemeSettings();


ThemeData globalTheme(bool settTheme) {
  if (settTheme == true) {
    return ThemeData(
      fontFamily: "Georgia",
      splashColor: Colors.tealAccent,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ).copyWith(
        secondary: Colors.green,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline4: TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal, color: Colors.white, fontStyle: FontStyle.italic),
        headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: "Hing", color: Colors.teal),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.teal,
        textTheme: ButtonTextTheme.accent,
      ),
      listTileTheme: const ListTileThemeData (
        textColor: Colors.black87,
      ),
    );
  } else {
    return ThemeData(
      fontFamily: "Georgia",
      splashColor: Colors.tealAccent,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ).copyWith(
        secondary: Colors.green,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline4: TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal, color: Colors.white, fontStyle: FontStyle.italic),
        headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: "Hing", color: Colors.teal),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.teal,
        textTheme: ButtonTextTheme.accent,
      ),
      listTileTheme: const ListTileThemeData (
        textColor: Colors.white,
      ),
    );
  }
}