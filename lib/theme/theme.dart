import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/theme/fonts.dart';

final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: appBarTitle,
        centerTitle: true,
        backgroundColor: Colors.white),
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
    scaffoldBackgroundColor: lightScaffoldColor);
