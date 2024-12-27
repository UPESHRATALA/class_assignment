import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<List<Map<String, String>>> {
  StudentCubit() : super([]);

  void addStudent(String name, String age, String address) {
    final newStudent = {'name': name, 'age': age, 'address': address};
    state.add(newStudent);
    emit(List.from(state)); // Emit the updated list
  }

  void deleteStudent(int index) {
    state.removeAt(index);
    emit(List.from(state)); // Emit the updated list after deletion
  }
}
