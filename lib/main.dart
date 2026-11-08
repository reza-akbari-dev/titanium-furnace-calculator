import 'package:flutter/material.dart';

import 'screens/calculator_screen.dart';

void main() {
  runApp(const FurnaceCalculatorApp());
}

class FurnaceCalculatorApp extends StatelessWidget {
  const FurnaceCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titanium Furnace Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}
