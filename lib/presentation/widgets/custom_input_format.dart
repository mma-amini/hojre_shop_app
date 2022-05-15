import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({required this.maxDigits});
  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,###");
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class LimitNumberInputFormatter extends TextInputFormatter {
  LimitNumberInputFormatter({required this.minNumber, required this.maxNumber});
  final int minNumber;
  final int maxNumber;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (int.parse(newValue.text) < minNumber) {
      return oldValue;
    }

    if (int.parse(newValue.text) > maxNumber) {
      return oldValue;
    }

    return newValue;
  }
}
