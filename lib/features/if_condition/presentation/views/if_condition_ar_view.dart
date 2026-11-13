import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/ar_view_frame.dart';
import '../view_model/variable_value_cubit.dart';
import '../view_model/variable_value_state.dart';
import 'widgets/value_editor_sheet.dart';

class IfConditionArView extends StatelessWidget {
  const IfConditionArView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VariableValueCubit>();
    return ArViewFrame(
      onCreated: cubit.onSceneCreated,
      overlay: BlocBuilder<VariableValueCubit, VariableValueState>(
        builder: (_, state) => Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            state.cameraAllowed ? state.label : 'محتاجين إذن الكاميرا',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      below: [
        SizedBox(height: 20.h),
        FloatingActionButton(
          tooltip: 'تغيير قيمة المتغير',
          onPressed: () async {
            final input = await showValueEditorSheet(
              context,
              cubit.state.value.toString(),
            );
            if (input != null) await cubit.updateValue(input);
          },
          child: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
