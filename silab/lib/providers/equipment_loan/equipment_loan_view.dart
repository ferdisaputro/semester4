import 'package:flutter/material.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_card.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_content.dart';
import 'package:silab/widgets/centered_stat_card.dart';
import 'package:silab/widgets/centered_stat_text.dart';

class EquipmentLoanView extends StatelessWidget {
  const EquipmentLoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          spacing: 30,
          children: [
            CenteredStatCard(
              gradientColors: [Color(0xFFA0A0E8), Color(0xFF53CFC7)],
              children: [
                CenteredStatText('40', 'Peminjaman'),
                CenteredStatText('20', 'Sedang Dipinjam'),
                CenteredStatText('20', 'Kembali'),
              ],
            ),

            EquipmentLoanContent(),
          ],
        ),
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
