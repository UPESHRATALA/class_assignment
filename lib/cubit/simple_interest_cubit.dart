import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0);

  void calculateInterest(double principal, double rate, double time) {
    emit(principal * rate * time / 100);
  }
}
