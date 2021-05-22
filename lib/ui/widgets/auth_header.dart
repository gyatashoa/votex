import 'package:flutter/material.dart';
import 'package:votex/theme/color_palete.dart';

class AuthHeader extends StatelessWidget {
  final String mainText;

  const AuthHeader(this.mainText);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(this.mainText, style: Theme.of(context).textTheme.headline1),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            height: 18,
            width: 18,
            decoration:
                BoxDecoration(color: primaryGreenColor, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}
