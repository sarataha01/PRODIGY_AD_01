import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_values.dart';
import '../../constants/colors.dart';
import '../../services/calculation_provider.dart';

class BuildButtons extends StatelessWidget {
  final String value;
  const BuildButtons({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculationProvider>(context, listen: false);
    return Material(
      color: ButtonValues.clearButtons.contains(value)
          ? MyColors.clearButton
          : ButtonValues.operationButtons.contains(value)
              ? MyColors.operationButton
              : MyColors.numberedButton,
      clipBehavior: Clip.hardEdge,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: () {
          calculator.onButtonPressed(value);
        },
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
