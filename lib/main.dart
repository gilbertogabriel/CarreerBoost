import 'package:carrier_boost/firebase_options.dart';
import 'package:carrier_boost/presentation/freight_calculator/freight_calculator_screen.dart';
import 'package:carrier_boost/presentation/registration/registration_phone_number.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frete grão',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const RegistrationPhoneNumber(),
    );
  }
}
