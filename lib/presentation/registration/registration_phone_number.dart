import 'package:carrier_boost/presentation/common/components/foo_app_bar.dart';
import 'package:carrier_boost/presentation/common/components/cellphone_input.dart';
import 'package:carrier_boost/presentation/common/components/large_button.dart';
import 'package:carrier_boost/presentation/common/components/main_title.dart';
import 'package:carrier_boost/presentation/registration/registration_password.dart';
import 'package:flutter/material.dart';

class RegistrationPhoneNumber extends StatefulWidget {
  const RegistrationPhoneNumber({Key? key}) : super(key: key);

  @override
  State<RegistrationPhoneNumber> createState() => _RegistrationPhoneNumberState();
}

class _RegistrationPhoneNumberState extends State<RegistrationPhoneNumber> {
  final _cellphoneNumberFormKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(titleAppBar:'Cadastro'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: ListView(
            children: [
              const MainTitle('Qual seu telefone?'),
              Form(
                key: _cellphoneNumberFormKey,
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CellphoneInput(title: 'Numero de celular', label: '',controller: textController),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LargeButton(text: 'Continuar', function: () {
                if(_cellphoneNumberFormKey.currentState!.validate()){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPassword(formatedPhoneNumber:textController.text,)));
                }
                else{
                  print('error');
                }

              }),
            ],
          ),
        ));
  }
}
