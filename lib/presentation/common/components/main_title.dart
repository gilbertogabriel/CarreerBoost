import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';


class MainTitle extends StatelessWidget {
  final String title;
  final TextAlign? align;

  const MainTitle(this.title, {Key? key, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: ThemeTextSemiBold.headline.copyWith(color: ThemeColors.black),
    );
  }
}