import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access DashboardCubit using BlocProvider
    final dashboardCubit = BlocProvider.of<DashboardCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upesh Class Assignment 2",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Centers the content vertically and horizontally
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centers content horizontally
            children: [
              const Text(
                'Choose a Feature',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent, // Matching color with AppBar
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ), // Adds space between the title and buttons

              // Button for Simple Interest
              ElevatedButton(
                onPressed: () => dashboardCubit.openSimpleInterestView(context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  backgroundColor: Colors.blueAccent, // Unified color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Simple Interest",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20), // Spacing between buttons

              // Button for Area of Circle
              ElevatedButton(
                onPressed: () => dashboardCubit.openAreaOfCircleView(context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  backgroundColor: Colors.blueAccent, // Unified color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Area of Circle",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20), // Spacing between buttons

              // Button for Student
              ElevatedButton(
                onPressed: () => dashboardCubit.openStudentCubitView(context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  backgroundColor: Colors.blueAccent, // Unified color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Student",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
