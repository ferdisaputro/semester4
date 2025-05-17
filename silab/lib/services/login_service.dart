import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:silab/config/app_config.dart';

class LoginService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('${AppConfig.baseUrl}/api/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // ✅ Simpan token di SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', responseData['token']);

        return responseData;
      } else {
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error during login: ${e.toString()}');
    }
  }
}
