import 'package:flutter/material.dart';
import 'equipment_loan_confirmation.dart'; // Import konten pegawai & mahasiswa

class EquipmentLoanReturn extends StatefulWidget {
  final int loanId;

  const EquipmentLoanReturn({Key? key, required this.loanId}) : super(key: key);

  @override
  State<EquipmentLoanReturn> createState() => _EquipmentLoanReturnState();
}

class _EquipmentLoanReturnState extends State<EquipmentLoanReturn> {
  String selectedRole = 'pegawai'; // default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 8),
              )
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset('assets/silab.png', height: 40),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Pilihan Pegawai & Mahasiswa
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedRole == 'pegawai' ? Colors.teal : Colors.grey[300],
                  foregroundColor: selectedRole == 'pegawai' ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    selectedRole = 'pegawai';
                  });
                },
                child: const Text('Pegawai'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedRole == 'mahasiswa' ? Colors.teal : Colors.grey[300],
                  foregroundColor: selectedRole == 'mahasiswa' ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    selectedRole = 'mahasiswa';
                  });
                },
                child: const Text('Mahasiswa'),
              ),
            ],
          ),
          // Konten yang berubah
          Expanded(
            child: EquipmentLoanConfirmation(
              loanId: widget.loanId,
              selectedRole: selectedRole,
            ),
          ),
        ],
      ),
    );
  }
}
