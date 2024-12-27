import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/area_of_circle_cubit.dart';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({Key? key}) : super(key: key);

  @override
  _AreaOfCircleViewState createState() => _AreaOfCircleViewState();
}

class _AreaOfCircleViewState extends State<AreaOfCircleView> {
  final TextEditingController _radiusController = TextEditingController();

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final areaOfCircleCubit = BlocProvider.of<AreaOfCircleCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle Calculator'),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Section
            const Text(
              "Calculate the Area of a Circle",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Radius Input Field
            TextField(
              controller: _radiusController,
              decoration: InputDecoration(
                labelText: 'Enter Radius',
                hintText: 'e.g., 7',
                prefixIcon: const Icon(Icons.circle, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Calculate Button
            ElevatedButton(
              onPressed: () {
                final radius = double.tryParse(_radiusController.text) ?? 0;
                if (radius > 0) {
                  areaOfCircleCubit.calculateArea(radius);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a valid radius')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Calculate Area",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),

            // Result Section
            const Text(
              "Result",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Display Area Using BlocBuilder
            BlocBuilder<AreaOfCircleCubit, double>(
              builder: (context, area) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  child: Text(
                    area > 0
                        ? "Area of Circle: ${area.toStringAsFixed(2)}"
                        : "Enter radius and calculate the area",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
