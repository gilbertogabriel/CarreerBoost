import 'dart:async';

import 'package:carrier_boost/presentation/common/components/foo_app_bar.dart';
import 'package:carrier_boost/presentation/common/components/main_title.dart';
import 'package:carrier_boost/presentation/theme/theme_colors.dart';
import 'package:carrier_boost/presentation/theme/theme_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class RegistrationPassword extends StatefulWidget {
  final String formatedPhoneNumber;

  const RegistrationPassword({Key? key, required this.formatedPhoneNumber})
      : super(key: key);

  @override
  State<RegistrationPassword> createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {
  Timer? timerSMS;
  Timer? timerWhats;
  static const int seconstToWait = 60;

  bool showError = false;

  int secondsWhats = seconstToWait;
  var secondsSMS = seconstToWait;
  late void Function() onPressedSMS;
  late void Function() onPressedWhats;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    timerSMS = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      setState(() {
        secondsSMS--;
      });
      if (secondsSMS == 0) {
        secondsSMS = seconstToWait;
        timer.cancel();
      }
    });

    super.initState();
  }

  Future<String?> validadePin(String pin) async {
    if (pin.length <= 6) {
      return ' ';
    } else {
      FirebaseAuth.instance.signInWithPhoneNumber('34988970211');
    }
  }

  Widget getPin() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: ThemeTextSemiBold.title,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.g200),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: ThemeColors.info),
        borderRadius: BorderRadius.circular(8));

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: ThemeColors.white,
        border: Border.all(color: ThemeColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: ThemeColors.error),
      ),
    );

    return Form(
      key: _formKey,
      child: Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          errorPinTheme: errorPinTheme,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          length: 6,
          submittedPinTheme: submittedPinTheme,
          errorTextStyle:
              ThemeTextRegular.body_2.copyWith(color: ThemeColors.error),
          validator: (pin) {
            if (!showError) return null;
            return 'Código inválido, tente novamente';
          },
          showCursor: true,
          onCompleted: (pin) async {
            showError = false;
            _formKey.currentState!.validate();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    onPressedWhats = () {
      setState(() {
        timerWhats = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (!mounted) return;
          setState(() {
            secondsWhats--;
          });
          if (secondsWhats == 0) {
            secondsWhats = seconstToWait;
            timer.cancel();
          }
        });
      });
    };

    onPressedSMS = () {};

    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 24),
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: ListView(
                children: [
                  const MainTitle('Enviamos um código para:'),
                  GestureDetector(
                    onTap: () {},
                    child: AbsorbPointer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              widget.formatedPhoneNumber,
                              style: ThemeTextSemiBold.display_1
                                  .copyWith(color: ThemeColors.primary),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child:
                        Text('Preencha com o código recebido no seu celular.'),
                  ),
                  getPin(),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 12),
                    child: Text('Não recebeu o código? Receba novamente via:'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (secondsSMS != seconstToWait)
                          ? Expanded(
                              child: OutlinedButton(
                                  onPressed: null,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.black38, width: 1),
                                  ),
                                  child: SizedBox(
                                    width: 130,
                                    height: 39,
                                    child: Center(
                                      child: Text(
                                        'SMS' " ${secondsSMS.toString()}s",
                                        textAlign: TextAlign.center,
                                        style: ThemeTextSemiBold.body_3
                                            .copyWith(color: ThemeColors.b100),
                                      ),
                                    ),
                                  )),
                            )
                          : Expanded(
                              child: OutlinedButton(
                                  onPressed: onPressedSMS,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: ThemeColors.primary, width: 1),
                                  ),
                                  child: SizedBox(
                                    width: 130,
                                    height: 39,
                                    child: Center(
                                      child: Text(
                                        'SMS',
                                        textAlign: TextAlign.center,
                                        style: ThemeTextSemiBold.body_3
                                            .copyWith(color: ThemeColors.black),
                                      ),
                                    ),
                                  )),
                            ),
                      const VerticalDivider(width: 10),
                      (secondsWhats != seconstToWait)
                          ? Expanded(
                              child: OutlinedButton(
                                  onPressed: null,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.black38, width: 1),
                                  ),
                                  child: SizedBox(
                                    width: 130,
                                    height: 39,
                                    child: Center(
                                      child: Text(
                                        'Whatsapp'
                                        " ${secondsWhats.toString()}s",
                                        textAlign: TextAlign.center,
                                        style: ThemeTextSemiBold.body_2
                                            .copyWith(color: ThemeColors.b100),
                                      ),
                                    ),
                                  )),
                            )
                          : Expanded(
                              child: OutlinedButton(
                                  onPressed: onPressedWhats,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: ThemeColors.primary, width: 1),
                                  ),
                                  child: SizedBox(
                                    width: 130,
                                    height: 39,
                                    child: Center(
                                      child: Text(
                                        'Whatsapp',
                                        textAlign: TextAlign.center,
                                        style: ThemeTextSemiBold.body_3
                                            .copyWith(color: ThemeColors.black),
                                      ),
                                    ),
                                  )),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
