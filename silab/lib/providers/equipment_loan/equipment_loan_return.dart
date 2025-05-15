import 'package:flutter/material.dart';
import 'equipment_loan_employee.dart'; // Import konten pegawai
import 'equipment_loan_student.dart';  // Import konten mahasiswa

class EquipmentLoanReturn extends StatefulWidget {
  final int loanId;

  const EquipmentLoanReturn({Key? key, required this.loanId}) : super(key: key);

  @override
  State<EquipmentLoanReturn> createState() => _EquipmentLoanReturnState();
}

class _EquipmentLoanReturnState extends State<EquipmentLoanReturn> {
  String selectedRole = 'pegawai'; // default

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          decoration: BoxDecoration(
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset('assets/silab.png', height: 40),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
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
                child: Text('Pegawai'),
              ),
              SizedBox(width: 10),
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
                child: Text('Mahasiswa'),
              ),
            ],
          ),
          // SizedBox(height: 20),
          // Konten yang berubah
         Expanded(
            child: Center(
              child: selectedRole == 'pegawai'
                  ? EquipmentLoanEmployeePage(loanId: widget.loanId)
                  // : EquipmentLoanStudentPage(loanId: widget.loanId),
                  : Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
