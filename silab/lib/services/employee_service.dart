import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silab/models/employee.dart';

class EmployeeService {
  final String baseUrl = 'http://192.168.239.66:8000/api';

  Future<List<Employee>> fetchEmployees() async {
    final url = Uri.parse("$baseUrl/employees");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Employee.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

// Optional: tambah, update, hapus employee
}
