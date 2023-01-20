import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final SvgPicture? iconleft;
  final SvgPicture? iconRight;
  final void Function() function;
  final Color color;

  const LargeButton(
      {required this.text,
        required this.function,
        this.iconleft,
        this.iconRight,
        Key? key,
        this.color = ThemeColors.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (iconleft != null)
                ? Padding(
              padding: const EdgeInsets.only(right: 11.0),
              child: iconleft,
            )
                : const SizedBox.shrink(),
            Text(
              text,
              style:
              ThemeTextSemiBold.body_3.copyWith(color: ThemeColors.white),
            ),
            (iconRight != null)
                ? Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: iconRight,
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}