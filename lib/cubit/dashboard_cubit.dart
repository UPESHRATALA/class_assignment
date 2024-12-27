import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/view/simple_interest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/area_of_circle_cubit.dart';
import '../cubit/student_cubit.dart'; // Import the StudentCubit
import '../view/area_of_circle_view.dart';
import '../view/student_view.dart'; // Import the StudentCubitView

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._simpleInterestCubit,
    this._areaOfCircleCubit,
    this._studentCubit, // Passing StudentCubit instead of StudentCubitView
  ) : super(null);

  final SimpleInterestCubit _simpleInterestCubit;
  final AreaOfCircleCubit _areaOfCircleCubit;
  final StudentCubit _studentCubit;

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: SimpleInterestView(),
        ),
      ),
    );
  }

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfCircleCubit,
          child: AreaOfCircleView(),
        ),
      ),
    );
  }

  void openStudentCubitView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _studentCubit, // Providing StudentCubit instance
          child: StudentCubitView(),
        ),
      ),
    );
  }
}
