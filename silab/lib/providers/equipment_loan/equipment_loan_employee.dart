import 'package:flutter/material.dart';
import 'package:silab/models/equipment_loan_detail.dart';
import 'package:silab/services/equipment_loan_service.dart';
import 'package:silab/models/equipment_loan.dart';
import 'package:intl/intl.dart';

class EquipmentLoanEmployeePage extends StatefulWidget {
  final int loanId;
  const EquipmentLoanEmployeePage({Key? key, required this.loanId}) : super(key: key);

  @override
  State<EquipmentLoanEmployeePage> createState() => _EquipmentLoanEmployeePageState();
}

class _EquipmentLoanEmployeePageState extends State<EquipmentLoanEmployeePage> {
  late Future<EquipmentLoan> _equipmentLoanFuture;

  @override
  void initState() {
    super.initState();
    
    _equipmentLoanFuture = EquipmentLoanService().fetchEquipmentLoanById(widget.loanId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<EquipmentLoan>(
        future: _equipmentLoanFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak ditemukan'));
          }

          final loan = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Id: ${loan.id}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Text('Informasi Pengembali', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Pilih Pegawai", border: OutlineInputBorder()),
                  value: loan.staffReturner?.user?.name,
                  items: [
                    if (loan.staffReturner != null)
                      DropdownMenuItem(value: loan.staffReturner!.user?.name, child: Text(loan.staffReturner!.user?.name ?? "-")),
                  ],
                  onChanged: (_) {},
                ),

                const SizedBox(height: 24),
                buildSectionTitle("Data Petugas"),

                buildDateTimeRow("Tanggal Peminjaman", loan.borrowingDate),
                buildDateTimeRow("Tanggal Pengembalian", loan.returnDate ?? DateTime.now()),

                buildInfoField("Petugas Penanggung Jawab Peminjaman", loan.staffBorrower?.user?.name ?? "-"),
                const SizedBox(height: 8),
                buildInfoField("Petugas Penanggung Jawab Pengembalian", loan.staffReturner?.user?.name ?? "-"),

                const SizedBox(height: 24),
                buildSectionTitle("Alat yang Dipinjam"),

                ...List.generate(
                  loan.equipmentLoanDetails?.length ?? 0,
                  (i) => buildItemCard(i + 1, loan.equipmentLoanDetails![i]),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Data berhasil disimpan')),
            );
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget buildDateTimeRow(String label, DateTime dateTime) {
    final String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime);
    final String formattedTime = DateFormat("HH:mm").format(dateTime);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: formattedDate,
              readOnly: true,
              decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 100,
            child: TextFormField(
              initialValue: formattedTime,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Jam", border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

  Widget buildItemCard(int index, EquipmentLoanDetail item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text("Barang $index", style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: item.labItemId != null ? item.labItemId.toString() : '-',
              readOnly: true,
              decoration: const InputDecoration(labelText: "Barang", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.qty != null ? item.qty.toString() : '',
                    readOnly: true,
                    decoration: const InputDecoration(labelText: "Jumlah Pinjam", border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: item.returnQty != null ? item.returnQty.toString() : '',
                    decoration: const InputDecoration(labelText: "Jumlah Kembali", border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: item.description ?? '',
              maxLines: 2,
              decoration: const InputDecoration(labelText: "Keterangan", border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}

