import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/screens/calculator_screen.dart';

import 'constants/colors.dart';
import 'services/calculation_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => CalculationProvider(),
        ),
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MyColors.mainApp,
          ),
          home: const CalculatorScreen(),
        ),
      ),
    );
  }
}
