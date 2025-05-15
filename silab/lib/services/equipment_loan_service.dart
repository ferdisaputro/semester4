import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:silab/config/app_config.dart';
import 'package:silab/models/equipment_loan.dart';

class EquipmentLoanService {
  Future<List<EquipmentLoan>> fetchEquipmentLoans() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/peminjaman");
    final response = await http.get(url);
    // print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => EquipmentLoan.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load equipment loans');
    }
  }

//  / ✅ Mengambil detail peminjaman berdasarkan ID
  Future<EquipmentLoan> fetchEquipmentLoanById(int id) async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/peminjaman/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final equipmentLoanData = data['equipment_loan'];
      return EquipmentLoan.fromJson(equipmentLoanData);
    } else {
      throw Exception('Gagal memuat data peminjaman dengan ID $id');
    }
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