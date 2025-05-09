// employee_card.dart
import 'package:flutter/material.dart';
import 'package:silab/models/employee.dart';
import 'package:silab/models/staff.dart';

class EmployeeCard extends StatelessWidget {
  final Staff staff;
  const EmployeeCard({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black54,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(staff.user?.name ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(staff.staffStatus?.staffStatus ?? 'Unknown'),
        trailing: const Icon(Icons.more_horiz),
      ),
    );
  }
}
