import 'package:flutter/material.dart';
import 'package:votex/theme/fonts.dart';

class CustomDateField extends TextField {
  final TextEditingController controller;
  CustomDateField(this.controller)
      : super(
            enabled: false,
            controller: controller,
            style: textFieldInputFont,
            decoration: InputDecoration(labelText: 'Date of Birth'));
}
