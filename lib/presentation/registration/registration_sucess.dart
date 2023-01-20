import 'package:carrier_boost/presentation/common/components/input_description.dart';
import 'package:carrier_boost/presentation/common/components/large_button.dart';
import 'package:carrier_boost/presentation/common/components/main_title.dart';
import 'package:carrier_boost/presentation/welcome/welcome.dart';
import 'package:flutter/material.dart';

class RegistrationSucess extends StatelessWidget {
  const RegistrationSucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.network('https://cdn-icons-png.flaticon.com/512/148/148767.png',width: 200),
            ),
            MainTitle('Sucesso ao criar conta'),
            InputDescription('Seja bem vindo a nossa comunidade')
          ],
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LargeButton(text: 'Manter logado', function: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
              }),
            ],
          ),
        )
    );
  }
}
