import '../../domain/variable_value.dart';

class VariableValueState {
  const VariableValueState({
    this.name = 'x',
    this.value = const VariableValue(5),
    this.cameraAllowed = true,
  });

  final String name;
  final VariableValue value;
  final bool cameraAllowed;

  String get label => '$name = $value';

  VariableValueState copyWith({VariableValue? value, bool? cameraAllowed}) =>
      VariableValueState(
        name: name,
        value: value ?? this.value,
        cameraAllowed: cameraAllowed ?? this.cameraAllowed,
      );
}
