import 'package:flutter/material.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_content.dart';

class EquipmentLoanView extends StatelessWidget {
  const EquipmentLoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: EquipmentLoanContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
