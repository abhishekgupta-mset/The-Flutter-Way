import 'package:flutter/material.dart';
import 'package:tip_calculator/screens/TipCalculatorScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp(context);
  }

  MaterialApp buildMaterialApp(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
            appBar: AppBar(title: const Text("Tip Calculator")),
            body: const TipCalculatorScreen()));
  }
}