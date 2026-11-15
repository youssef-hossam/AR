import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/ar_view_frame.dart';
import '../view_model/variable_box_cubit.dart';
import '../view_model/variable_box_state.dart';

class VariableBoxArView extends StatelessWidget {
  const VariableBoxArView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VariableBoxCubit>();
    return ArViewFrame(
      enableTap: true,
      onCreated: cubit.onSceneCreated,
      overlay: BlocBuilder<VariableBoxCubit, VariableBoxState>(
        builder: (_, state) => _Hint(_hintFor(state)),
      ),
    );
  }

  String _hintFor(VariableBoxState state) => switch (state) {
        VariableBoxState.idle => 'جاري تشغيل الكاميرا…',
        VariableBoxState.permissionDenied => 'محتاجين إذن الكاميرا',
        VariableBoxState.closed => 'دوس على البوكس عشان تفتحه',
        VariableBoxState.opening => 'بنفتح البوكس…',
        VariableBoxState.opened => 'birdName = "parrot" 🦜',
      };
}

class _Hint extends StatelessWidget {
  const _Hint(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
