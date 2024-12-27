import 'package:class_assignment_2/cubit/area_of_circle_cubit.dart';
import 'package:class_assignment_2/cubit/dashboard_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/cubit/student_cubit.dart';
import 'package:class_assignment_2/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final simpleInterestCubit = SimpleInterestCubit();
  final areaOfCircleCubit = AreaOfCircleCubit();
  final studentCubit = StudentCubit();

  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (_) => DashboardCubit(
          simpleInterestCubit,
          areaOfCircleCubit,
          studentCubit,
        ),
        child: DashboardView(), // Pass only the view here, not the cubit
      ),
    ),
  );
}
