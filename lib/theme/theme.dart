import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/theme/fonts.dart';

final ThemeData lightTheme = ThemeData(
    primaryColor: primaryGreenColor,
    textTheme: TextTheme(
      bodyText1: primaryText1,
      headline1: mainHeader1,
      headline2: mainHeader2,
      subtitle1: faintedTextPrimary,
      subtitle2: faintedTextSecondary,
    ),
    accentIconTheme: IconThemeData(color: primaryGreenColor),
    iconTheme: IconThemeData(),
    buttonTheme: ButtonThemeData(),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: primaryGreenColor, textStyle: buttonText1)),
    scaffoldBackgroundColor: lightScaffoldColor);