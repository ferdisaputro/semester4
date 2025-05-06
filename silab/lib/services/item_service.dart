import 'dart:convert';

import 'package:silab/config/app_config.dart';
import 'package:silab/models/item.dart';
import 'package:http/http.dart' as http;


class ItemService {
  Future<List<Item>> getItems() async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/barang");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}