import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber_clone/presentation/screens/home.dart';
import 'package:uber_clone/states/app_state.dart';

void main() {
  return runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: AppState(),)
  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frete grão',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Frete grão'),
    );
  }
}


