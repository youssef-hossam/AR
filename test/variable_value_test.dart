import 'package:ar/features/if_condition/domain/variable_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VariableValue.parse', () {
    test('numbers become int and the box is green', () {
      final v = VariableValue.parse(' 42 ');
      expect(v.raw, 42);
      expect(v.type, ValueType.number);
      expect(v.color, Colors.green);
    });

    test('true / false become bool and the box is yellow', () {
      expect(VariableValue.parse('TRUE').raw, true);
      expect(VariableValue.parse('false').type, ValueType.boolean);
      expect(VariableValue.parse('false').color, Colors.yellow);
    });

    test('anything else is text and the box is blue', () {
      final v = VariableValue.parse('Youssef');
      expect(v.raw, 'Youssef');
      expect(v.color, Colors.blue);
    });
  });
}
