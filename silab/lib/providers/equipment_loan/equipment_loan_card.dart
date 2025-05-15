import 'package:flutter/material.dart';
import 'package:silab/models/equipment_loan.dart';
import 'package:silab/providers/equipment_loan/equipment_loan_return.dart';

class EquipmentLoanCard extends StatelessWidget {
  final EquipmentLoan equipmentLoan;
  const EquipmentLoanCard(this.equipmentLoan, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  'Peminjam: ${equipmentLoan.isStaff == 1 ? 'Staff' : 'Mahasiswa'}',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  if (equipmentLoan.status == 1)
                  GestureDetector(
                    onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Pengembalian Pinjaman'),
                        actions: [
                        TextButton(
                          onPressed: () {
                          Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                        TextButton(
                          onPressed: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EquipmentLoanReturn(
                              loanId: equipmentLoan.id,
                            ),
                          ),
                          );
                          },
                          child: Text('Kembalikan Pinjaman'),
                        ),
                        ],
                      );
                      },
                    );
                    },
                    child: Icon(Icons.more_horiz, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                equipmentLoan.isStaff == 1 
                    ? (equipmentLoan.staffBorrower?.user?.name ?? 'Unknown Staff') 
                    : (equipmentLoan.name ?? 'Unknown Borrower'),
                // ",",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Status", style: TextStyle(color: Colors.black54)),
                      Text(
                        equipmentLoan.status == 1 ? 'Dipinjam' : 'Dikembalikan',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jumlah Peminjaman", style: TextStyle(color: Colors.black54)),
                      Text(
                        equipmentLoan.equipmentLoanDetails?.length.toString() ?? '0',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}