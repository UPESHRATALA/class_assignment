import 'package:class_assignment_2/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubitView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  StudentCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Management"),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title
            const Text(
              "Add Student Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Name input field
            _buildTextField(
              controller: nameController,
              label: "Name",
              hint: "Enter student's name",
              icon: Icons.person,
            ),
            const SizedBox(height: 16),

            // Age input field
            _buildTextField(
              controller: ageController,
              label: "Age",
              hint: "Enter student's age",
              icon: Icons.cake,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Address input field
            _buildTextField(
              controller: addressController,
              label: "Address",
              hint: "Enter student's address",
              icon: Icons.location_on,
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text.trim();
                final String age = ageController.text.trim();
                final String address = addressController.text.trim();

                if (name.isNotEmpty && age.isNotEmpty && address.isNotEmpty) {
                  context.read<StudentCubit>().addStudent(name, age, address);
                  nameController.clear();
                  ageController.clear();
                  addressController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields!")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Add Student", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 24),

            // Title for Student List
            const Text(
              "Student List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),

            // Display student list
            BlocBuilder<StudentCubit, List<Map<String, String>>>(
              builder: (context, studentList) {
                if (studentList.isEmpty) {
                  return const Center(
                    child: Text(
                      "No students added yet",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    final student = studentList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          student['name'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Age: ${student['age']}, Address: ${student['address']}",
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            context.read<StudentCubit>().deleteStudent(index);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // A reusable method for styled text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
