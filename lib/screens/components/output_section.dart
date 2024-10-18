import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/services/calculation_provider.dart';

class OutputSection extends StatelessWidget {
  const OutputSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final display = Provider.of<CalculationProvider>(context).display;
    return Container(
      alignment: Alignment.bottomRight,
      child: Text(
        display,
        style: const TextStyle(fontSize: 48, overflow: TextOverflow.clip),
        textAlign: TextAlign.end,
      ),
    );
  }
}
