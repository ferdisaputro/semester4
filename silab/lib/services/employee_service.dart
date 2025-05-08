import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silab/config/app_config.dart';
import 'package:silab/models/staff.dart';

class EmployeeService {
  Future<List<Staff>> fetchStaff() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/pegawai");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Staff.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

// Optional: tambah, update, hapus employee
}
