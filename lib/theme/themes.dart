import 'package:fen_timer/public/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    secondaryHeaderColor: kSecondaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryLightColor,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kBodyTextColorLight),
    primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: kBodyTextColorLight),
      bodyText2: TextStyle(color: kBodyTextColorLight),
      headline4: TextStyle(color: kTitleTextLightColor, fontSize: 32),
      headline1: TextStyle(color: kTitleTextLightColor, fontSize: 80),
      headline2: TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
    brightness: Brightness.light,
  );
  final darkTheme = ThemeData(
    primaryColor: kPrimaryColor,
    secondaryHeaderColor: kSecondaryColor,
    scaffoldBackgroundColor: Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    colorScheme: ColorScheme.dark(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ),
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kBodyTextColorDark),
    primaryIconTheme: IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: kBodyTextColorDark),
      bodyText2: TextStyle(color: kBodyTextColorDark),
      headline4: TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      headline1: TextStyle(color: kTitleTextDarkColor, fontSize: 80),
      headline2: TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
    brightness: Brightness.dark,
  );
}