import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';

import 'fonts.dart';

TextButtonThemeData get btnGreen => TextButtonThemeData(
    style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: primaryGreenColor,
        textStyle: buttonText1));
