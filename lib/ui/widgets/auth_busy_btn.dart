import 'package:flutter/material.dart';
import 'package:votex/theme/btn_styles.dart';
import 'package:votex/theme/fonts.dart';

class AuthBusyBtn extends StatefulWidget {
  final String text;
  final bool isBusy;
  final VoidCallback onPressed;
  const AuthBusyBtn(this.text,
      {required this.onPressed, this.isBusy = false, Key? key})
      : super(key: key);

  @override
  _AuthBusyBtnState createState() => _AuthBusyBtnState();
}

class _AuthBusyBtnState extends State<AuthBusyBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
          style: btnGreen.style,
          onPressed: this.widget.isBusy ? null : this.widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: this.widget.isBusy
                ? CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  )
                : Text(
                    this.widget.text,
                    style: buttonText1,
                  ),
          )),
    );
  }
}
