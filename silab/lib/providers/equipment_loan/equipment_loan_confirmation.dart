import 'dart:async';
import 'package:flutter/material.dart';
import 'package:silab/models/equipment_loan_detail.dart';
import 'package:silab/models/staff.dart';
import 'package:silab/services/equipment_loan_service.dart';
import 'package:silab/models/equipment_loan.dart';
import 'package:intl/intl.dart';
import 'package:silab/services/employee_service.dart';

class EquipmentLoanConfirmation extends StatefulWidget {
  final int loanId;
  final String selectedRole;

  const EquipmentLoanConfirmation({
    Key? key,
    required this.loanId,
    required this.selectedRole,
  }) : super(key: key);

  @override
  State<EquipmentLoanConfirmation> createState() => _EquipmentLoanConfirmationState();
}

class _EquipmentLoanConfirmationState extends State<EquipmentLoanConfirmation> {
  late Future<EquipmentLoan> _equipmentLoanFuture;
  List<Staff> staffList = [];
  Staff? selectedStaff;
  final _formKey = GlobalKey<FormState>();
  String nim = '', nama = '', kelompok = '';

  // Simpan controller di state agar tidak hilang saat rebuild
  List<TextEditingController> qtyReturnControllers = [];

  @override
  void initState() {
    super.initState();
    _equipmentLoanFuture = EquipmentLoanService().fetchEquipmentLoanById(widget.loanId);
    loadStaffList();
  }

  Future<void> loadStaffList() async {
    try {
      final fetchedStaff = await EmployeeService().fetchStaff();

      setState(() {
        staffList = fetchedStaff;
      });
    } catch (e) {
    }
  }

  @override
  void dispose() {
    for (var controller in qtyReturnControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Fungsi untuk inisialisasi controller jika belum diinisialisasi
  void initializeQtyControllersIfNeeded(int count) {
    if (qtyReturnControllers.length != count) {
      // Dispose dulu controller lama jika ada
      for (var controller in qtyReturnControllers) {
        controller.dispose();
      }
      qtyReturnControllers = List.generate(count, (_) => TextEditingController());
    }
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
          initializeQtyControllersIfNeeded(loan.equipmentLoanDetails?.length ?? 0);

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID Pinjam: ${loan.id}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text('Informasi Pengembali', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 16),

                  if (widget.selectedRole == 'pegawai') staffDropdown()
                  else studentForm(),

                  const SizedBox(height: 24),
                  buildSectionTitle("Data Petugas"),
                  buildDateTimeRow("Tanggal Peminjaman", loan.borrowingDate),

                  StreamBuilder<DateTime>(
                    stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const SizedBox.shrink();
                      final now = snapshot.data!;
                      final formattedDate = DateFormat("dd-MM-yyyy").format(now);
                      final formattedTime = DateFormat("HH:mm").format(now);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: InputDecorator(
                                decoration: const InputDecoration(labelText: "Tanggal Pengembalian", border: OutlineInputBorder()),
                                child: Text(formattedDate),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 100,
                              child: InputDecorator(
                                decoration: const InputDecoration(labelText: "Jam", border: OutlineInputBorder()),
                                child: Text(formattedTime),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  buildInfoField("Petugas Peminjam", loan.staffBorrower?.user?.name ?? "-"),
                  const SizedBox(height: 8),
                  buildInfoField("Petugas Pengembali", loan.staffReturner?.user?.name ?? "-"),
                  const SizedBox(height: 24),

                  buildSectionTitle("Alat yang Dipinjam"),

                  ...List.generate(
                    loan.equipmentLoanDetails?.length ?? 0,
                    (i) => buildItemCard(i + 1, loan.equipmentLoanDetails![i], qtyReturnControllers[i]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            submitReturn();
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  Future<void> submitReturn() async {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();
    final formattedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
    final formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    final loan = await _equipmentLoanFuture;

    List<Map<String, dynamic>> details = [];

    for (int i = 0; i < (loan.equipmentLoanDetails?.length ?? 0); i++) {
      final detail = loan.equipmentLoanDetails![i];
      final qtyReturn = int.tryParse(qtyReturnControllers[i].text) ?? 0;

      if (qtyReturn > (detail.qty ?? 0)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Jumlah kembali untuk barang ke-${i + 1} melebihi jumlah pinjam')),
        );
        return;
      }

      details.add({
        'loanDetailId': detail.id,
        'returnQty': qtyReturn,
      });
    }

    Map<String, dynamic> payload = {
      'return_date': formattedDate,
      'return_time': formattedTime,
      'loan_id': widget.loanId,
      'loan_detail_items': details,
      'is_staff': widget.selectedRole == 'pegawai', // <-- tambahkan is_staff
    };

    if (widget.selectedRole == 'pegawai') {
      if (selectedStaff == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pegawai wajib dipilih')),
        );
        return;
      }
      payload['staffReturner'] = selectedStaff?.id;
    } else {
      payload['returnerNim'] = nim;
      payload['returnerName'] = nama;
      payload['returnerGroupClass'] = kelompok;
    }

    try {
      await EquipmentLoanService().submitReturnData(payload, widget.loanId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengembalian berhasil disimpan')),
      );
      Navigator.pop(context,true ); // kembali ke halaman sebelumnya
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data: $e')),
      );
    }
  }

  Widget staffDropdown() {
    return DropdownButtonFormField<Staff>(
      value: selectedStaff,
      decoration: const InputDecoration(labelText: "Pilih Pegawai", border: OutlineInputBorder()),
      validator: (value) => value == null ? 'Pegawai wajib dipilih' : null,
      items: staffList.map((staff) {
        return DropdownMenuItem<Staff>(
          value: staff,
          child: Text(staff.user?.name ?? '-'),
        );
      }).toList(),
      onChanged: (Staff? newValue) {
        setState(() {
          selectedStaff = newValue;
        });
      },
    );
  }

  Widget studentForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: "NIM", border: OutlineInputBorder()),
          validator: (value) => value == null || value.isEmpty ? 'NIM wajib diisi' : null,
          onChanged: (val) => nim = val,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: "Nama", border: OutlineInputBorder()),
          validator: (value) => value == null || value.isEmpty ? 'Nama wajib diisi' : null,
          onChanged: (val) => nama = val,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: "Kelompok/Golongan", border: OutlineInputBorder()),
          validator: (value) => value == null || value.isEmpty ? 'Kelompok wajib diisi' : null,
          onChanged: (val) => kelompok = val,
        ),
      ],
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
  Widget buildItemCard(int index, EquipmentLoanDetail item, TextEditingController qtyReturnController) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text("Barang $index", style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: item.labItem?.item?.itemName,
              // initialValue: 'null',
              readOnly: true,
              decoration: const InputDecoration(labelText: "Barang", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.qty?.toString() ?? '',
                    readOnly: true,
                    decoration: const InputDecoration(labelText: "Jumlah Pinjam", border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: qtyReturnController,
                    keyboardType: TextInputType.number,
                    validator: (val) => (val == null || val.isEmpty) ? 'Jumlah kembali wajib diisi' : null,
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
