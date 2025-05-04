import 'package:flutter/material.dart';
import 'package:silab/models/equipment_loan.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_card.dart';
import 'package:silab/services/equipment_loan_service.dart';

class EquipmentLoanContent extends StatefulWidget {
  const EquipmentLoanContent({super.key});

  @override
  State<EquipmentLoanContent> createState() => _EquipmentLoanContentState();
}

class _EquipmentLoanContentState extends State<EquipmentLoanContent> {
  List<EquipmentLoan> _equipmentLoanList = [];

  @override
  void initState() {
    super.initState();
    getEquipmentLoans();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar dan Refresh Button
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 16),

        // Data Pegawai Text dengan Icon Button di sisi kanan
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data Peminjaman",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.refresh_sharp),
                onPressed: () {
                  getEquipmentLoans();
                }, // Tambahkan fungsi refresh di sini
              ),
            ],
          ),
        ),

        // List Jurusan
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _equipmentLoanList.length,
          itemBuilder: (context, index) {
            return _equipmentLoanList.map((equipmentLoan) => EquipmentLoanCard((equipmentLoan.isStaff == 1) ? equipmentLoan.staffId.toString() : equipmentLoan.name.toString())).toList()[index];
          },
        ),
      ],
    );
  }

  void getEquipmentLoans() async {
    final equipmentLoans = await EquipmentLoanService().fetchEquipmentLoans();
    setState(() {
      _equipmentLoanList = equipmentLoans;
    });
  }
}