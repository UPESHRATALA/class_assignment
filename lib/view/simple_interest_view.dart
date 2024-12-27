import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  _SimpleInterestViewState createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    _principalController.dispose();
    _rateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final simpleInterestCubit = BlocProvider.of<SimpleInterestCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            const Text(
              'Calculate Simple Interest',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),

            // Principal Input
            _buildTextField(
              controller: _principalController,
              label: 'Principal (P)',
              hint: 'Enter principal amount',
              icon: Icons.account_balance_wallet,
            ),
            const SizedBox(height: 16),

            // Rate Input
            _buildTextField(
              controller: _rateController,
              label: 'Rate of Interest (R%)',
              hint: 'Enter interest rate',
              icon: Icons.percent,
            ),
            const SizedBox(height: 16),

            // Time Input
            _buildTextField(
              controller: _timeController,
              label: 'Time (T in years)',
              hint: 'Enter time in years',
              icon: Icons.access_time,
            ),
            const SizedBox(height: 24),

            // Calculate Button
            ElevatedButton(
              onPressed: () {
                final principal =
                    double.tryParse(_principalController.text) ?? 0;
                final rate = double.tryParse(_rateController.text) ?? 0;
                final time = double.tryParse(_timeController.text) ?? 0;

                simpleInterestCubit.calculateInterest(principal, rate, time);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),

            // Result Display
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, interest) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: Text(
                    'Simple Interest: ${interest.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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

  // A reusable method for styled text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
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
      keyboardType: TextInputType.number,
    );
  }
}
