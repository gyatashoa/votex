import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/theme/fonts.dart';

final ThemeData lightTheme = ThemeData(
    primaryColor: primaryGreenColor,
    textTheme: TextTheme(
      bodyText1: primaryText1,
      headline1: mainHeader1,
      headline2: mainHeader2,
      headline3: mainHeader3,
      subtitle1: faintedTextPrimary,
      subtitle2: faintedTextSecondary,
    ),
    inputDecorationTheme: InputDecorationTheme(hintStyle: faintedTextPrimary),
    accentIconTheme: IconThemeData(color: primaryGreenColor),
    iconTheme: IconThemeData(),
    buttonTheme: ButtonThemeData(),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: primaryGreenColor,
            textStyle: buttonText1)),
    scaffoldBackgroundColor: lightScaffoldColor);
