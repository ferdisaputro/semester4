import 'dart:convert';

import 'package:silab/config/app_config.dart';
import 'package:silab/models/dashboard_data.dart';
import 'package:http/http.dart' as http;

class DashboardDataService {
  Future<DashboardData> fetchDashboardData() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/dashboard");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      return DashboardData.fromJson(data);
    } else {
      throw Exception('Failed to load equipment loans');
    }
  }
}