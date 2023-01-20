import 'package:carrier_boost/presentation/common/components/large_button.dart';
import 'package:carrier_boost/presentation/freight_calculator/freight_calculator_screen.dart';
import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
          child: ListView(
            children: [
              Text(
                'Seja bem vindo usuário',
                style: ThemeTextSemiBold.title
                    .copyWith(color: ThemeColors.primary),
              ),
              Center(child: SvgPicture.asset('assets/welcome.svg')),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 36),
          child: LargeButton(text: 'Calcular frete', function: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FreightCalculator()));
          }),
        ));
  }
}
