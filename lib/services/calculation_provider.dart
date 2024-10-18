import 'package:flutter/cupertino.dart';
import 'package:simple_calculator/constants/button_values.dart';

class CalculationProvider extends ChangeNotifier {
  late String _display = '0';
  String _firstValue = '';
  String _operation = '';
  String _currentValue = '';

  String get display => _display;

  void onButtonPressed(String value) {
    if (value == ButtonValues.clear) {
      _clear();
    } else if (value == ButtonValues.delete) {
      _delete();
    } else if (value == ButtonValues.add ||
        value == ButtonValues.subtract ||
        value == ButtonValues.multiply ||
        value == ButtonValues.divide) {
      _operation = value;
      _firstValue = _currentValue;
      _currentValue = '';
    } else if (value == ButtonValues.percent) {
      _changeToPercentage();
    } else if (value == '=') {
      _calculateResult();
    } else {
      _currentValue += value;
    }
    _display = _currentValue.isEmpty ? '0' : _currentValue;
    notifyListeners();
  }

  void _clear() {
    _display = '0';
    _operation = '';
    _firstValue = '';
    _currentValue = '';
    notifyListeners();
  }

  void _delete() {
    if (_currentValue.isNotEmpty) {
      _currentValue = _currentValue.substring(0, _currentValue.length - 1);
    } else if (_operation.isNotEmpty) {
      _operation = '';
    } else if (_firstValue.isNotEmpty) {
      _firstValue = _firstValue.substring(0, _firstValue.length - 1);
    }
    notifyListeners();
  }

  void _changeToPercentage() {
    if (_currentValue.isNotEmpty) {
      double value = double.parse(_currentValue);
      value = value / 100;
      _currentValue = value.toString();
      _display = _currentValue;
      notifyListeners();
    }
  }

  void _calculateResult() {
    if (_firstValue.isNotEmpty && _currentValue.isNotEmpty) {
      final previous = double.parse(_firstValue);
      final current = double.parse(_currentValue);
      double result;

      switch (_operation) {
        case ButtonValues.add:
          result = previous + current;
          break;
        case ButtonValues.subtract:
          result = previous - current;
          break;
        case ButtonValues.multiply:
          result = previous * current;
          break;
        case ButtonValues.divide:
          result = previous / current;
          break;
        default:
          result = current;
      }

      if (result == result.toInt()) {
        _display = result.toInt().toString();
      } else {
        _display = result.toString();
      }

      _currentValue = _display;
      notifyListeners();
    }
  }
}
