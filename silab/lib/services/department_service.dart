import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silab/config/app_config.dart';
import 'package:silab/models/department.dart';

class DepartmentService {
  Future<List<Department>> fetchDepartments() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/jurusan");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Department.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }

// Optional: method untuk tambah, update, delete
}
