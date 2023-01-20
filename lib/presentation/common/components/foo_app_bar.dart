import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppBar extends AppBar {
  final List<Widget> gdActions;
  final String titleAppBar;
  
  DefaultAppBar({super.key, this.titleAppBar = '', this.gdActions = const []})
      : super(
      elevation: 0,
      iconTheme: const IconThemeData(color: ThemeColors.black),
      backgroundColor: ThemeColors.background,
      title: Text(
        titleAppBar,
        style: GoogleFonts.getFont('Montserrat',
            textStyle: ThemeTextRegular.body_3
                .copyWith(color: ThemeColors.black)),
      ),
      automaticallyImplyLeading: true,
      actions: gdActions);
}