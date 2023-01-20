import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';


class InputDescription extends StatelessWidget {
  final String title;
  final TextAlign? align;

  const InputDescription(this.title, {Key? key, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: ThemeTextSemiBold.body_2.copyWith(color: ThemeColors.black),
    );
  }
}