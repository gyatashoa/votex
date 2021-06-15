import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/utils/dateutils.dart';

class DateServices {
  Future<DateTime?> showDateDialog(
      BuildContext context, DateTime initialDate) async {
    return await showDatePicker(
        context: context,
        initialDate: initialDate,
        builder: (ctx, widget) => Theme(
              child: widget!,
              data: ThemeData.light().copyWith(
                primaryColor: primaryGreenColor,
                accentColor: primaryGreenColor,
                colorScheme: ColorScheme.light(primary: primaryGreenColor),
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
            ),
        firstDate: DateUtil.initialDate,
        lastDate: DateUtil.endDate);
  }
}
