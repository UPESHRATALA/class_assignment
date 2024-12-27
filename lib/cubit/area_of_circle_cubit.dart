import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleCubit extends Cubit<double> {
  AreaOfCircleCubit() : super(0);

  void calculateArea(double radius) {
    emit(3.14159 * radius * radius);
  }
}
