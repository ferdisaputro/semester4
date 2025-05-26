import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silab/config/app_config.dart';
import 'package:silab/models/laboratory.dart';

class LaboratoryService {
  Future<List<Laboratory>> fetchLaboratory() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/laboratorium");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Laboratory.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load equipment loans');
    }
  }
}




