import 'package:flutter/material.dart';

/// The kinds of value a kid can put inside the box.
enum ValueType { number, text, boolean, other }

/// A value typed by the user, already parsed into its real Dart type.
class VariableValue {
  const VariableValue(this.raw);

  /// Parses user input: "true"/"false" → bool, digits → int, else String.
  factory VariableValue.parse(String input) {
    final text = input.trim();
    final lower = text.toLowerCase();
    if (lower == 'true' || lower == 'false') return VariableValue(lower == 'true');
    final number = int.tryParse(text);
    if (number != null) return VariableValue(number);
    return VariableValue(text);
  }

  final Object raw;

  /// This is the exact `if` logic the lesson teaches.
  ValueType get type {
    if (raw is int) return ValueType.number;
    if (raw is String) return ValueType.text;
    if (raw is bool) return ValueType.boolean;
    return ValueType.other;
  }

  Color get color => switch (type) {
        ValueType.number => Colors.green,
        ValueType.text => Colors.blue,
        ValueType.boolean => Colors.yellow,
        ValueType.other => Colors.grey,
      };

  @override
  String toString() => '$raw';
}
