import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:silab/config/app_config.dart';
import 'package:silab/models/study_program.dart';

class StudyProgramService {
  Future<List<StudyProgram>> fetchStudyProgram() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/program-studi");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StudyProgram.fromJson(item)).toList();
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