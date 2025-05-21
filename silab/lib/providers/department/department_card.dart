import 'package:flutter/material.dart';
import 'package:silab/models/department.dart';

class DepartmentCard extends StatelessWidget {
  final Department jurusan;

  const DepartmentCard({super.key, required this.jurusan});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(jurusan.department),
        subtitle: Text('Code: ${jurusan.code ?? '-'}'),
        trailing: Text('User ID: ${jurusan.userId ?? '-'}'),
      ),
    );
  }
}
