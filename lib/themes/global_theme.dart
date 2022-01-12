import 'package:flutter/material.dart';

class ThemeSettings {
  bool themeBrightness = false;
}

ThemeSettings themeSett = ThemeSettings();

ThemeData globalTheme() {
  if (themeSett.themeBrightness == false) {
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
        headline2: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        bodyText2:
            TextStyle(fontSize: 14.0, fontFamily: "Hing", color: Colors.teal),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.teal,
        textTheme: ButtonTextTheme.accent,
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
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        bodyText2:
            TextStyle(fontSize: 14.0, fontFamily: "Hing", color: Colors.teal),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.teal,
        textTheme: ButtonTextTheme.accent,
      ),
    );
  }
}
