import 'package:flutter/material.dart';

class EquipmentLoanCard extends StatelessWidget {
  final Map<String, String> department;
  const EquipmentLoanCard(this.department, {super.key});

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
                    department["kode"]!,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Icon(Icons.more_horiz, color: Colors.black),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                department["nama"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ka. Jurusan", style: TextStyle(color: Colors.black54)),
                  Text(
                    department["kaprodi"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );;
  }
}