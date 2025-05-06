// employee_content.dart
import 'package:flutter/material.dart';
import 'package:silab/models/employee.dart';
import 'package:silab/services/employee_service.dart';
import 'employee_card.dart';

class EmployeeContent extends StatelessWidget {
  const EmployeeContent({super.key});

  Future<List<Employee>> getEmployees() async {
    return await EmployeeService().fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Employee>>(
      future: getEmployees(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final employees = snapshot.data ?? [];

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: employees.length,
          itemBuilder: (context, index) {
            final employee = employees[index];
            return EmployeeCard(employee: employee);
          },
        );
      },
    );
  }
}
