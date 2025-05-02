import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:silab/models/equipment_loan.dart';

class EquipmentLoanService {
  final String baseUrl = 'http://192.168.239.66:8000/api';

  Future<List<EquipmentLoan>> fetchEquipmentLoans() async {
    final url = Uri.parse("$baseUrl/peminjaman");
    final response = await http.get(url);
    // print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => EquipmentLoan.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load equipment loans');
    }
  }













  // Future<List<EquipmentLoan>> getEquipmentLoans() async {
  //   final url = Uri.parse('http://192.168.239.66:8000/api/peminjaman');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     return data.map((item) => EquipmentLoan.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load equipment loans');
  //   }
  // }
}