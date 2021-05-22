import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';
import 'package:votex/theme/fonts.dart';
import 'package:votex/utils/appsettings.dart';

class CustomIcon1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: lightScaffoldColor),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              titleIntial,
              style: logoTextStyle1,
            ),
          ),
        ),
        Text(
          appTitle,
          style: Theme.of(context).textTheme.headline2,
        )
      ],
    );
  }
}

class CustomIcon2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: primaryGreenColor),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          titleIntial,
          style: logoTextStyle2,
        ),
      ),
    );
  }
}
