import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';


// ignore: non_constant_identifier_names
customInputDecoration(
    {String? label,
      bool showLabel = false,
      bool isOptional = false,
      bool showErrorMessage = true}) {
  var styleTextErr = ThemeTextSemiBold.body_2;

  if (!showErrorMessage) {
    styleTextErr = const TextStyle(height: 0);
  }
  return InputDecoration(
    errorStyle: styleTextErr,
    fillColor: Colors.white,
    filled: true,
    labelText: label,
    floatingLabelBehavior:
    (showLabel) ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
    labelStyle: ThemeTextRegular.body_3.copyWith(color: ThemeColors.b100),
    alignLabelWithHint: true,
    helperText: (isOptional) ? 'Opcional*' : null,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(width: 1, color: ThemeColors.g200),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(width: 1, color: ThemeColors.error),
    ),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(width: 1, color: ThemeColors.g200)),
  );
}