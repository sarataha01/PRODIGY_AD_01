import 'package:flutter/material.dart';
import 'package:simple_calculator/constants/button_values.dart';
import 'package:simple_calculator/screens/components/build_buttons.dart';

import 'components/output_section.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const Flexible(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: OutputSection(),
            ),
          ),
          Wrap(
            children: ButtonValues.buttonValues
                .map(
                  (value) => SizedBox(
                    width: value == ButtonValues.n0
                        ? screenSize.width / 2
                        : screenSize.width / 4,
                    height: screenSize.width / 4,
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: BuildButtons(value: value),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
