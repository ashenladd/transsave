import 'package:flutter/material.dart';

import '/themes/fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool useMargin;
  final bool isExpanded;
  final TextStyle? hintStyle;
  final int maxLines;
  final TextInputType? keyboardType;

  final double width;
  final String? Function(String?)? validator;

  const AppTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.hintText,
      this.useMargin = true,
      this.isExpanded = false,
      this.hintStyle,
      this.width = 275,
      this.maxLines = 1,
      this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : width,
      margin: useMargin ? EdgeInsets.symmetric(horizontal: 30) : null,
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            hintStyle: hintStyle,
            hintText: hintText,
            suffixIcon: suffixIcon,
            labelText: labelText,
            labelStyle: mainStyle.copyWith(color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            floatingLabelStyle: subtitleStyle2,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
      ),
    );
  }
}
