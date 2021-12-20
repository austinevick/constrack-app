import 'dart:convert';

import 'package:constrack/models/mda_model.dart';
import 'package:constrack/util/constants.dart';
import 'package:http/http.dart' as http;

class ConstrackRepository {
  Future<List<MDAModel>> getProjectsData() async {
    final Uri api = Uri.parse("$baseUrl/search_reps?key=$kApiKey");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> list = data;
      print(data);
      return list.map((map) => MDAModel.fromMap(map)).toList();
    } else {
      throw Exception('Failed to load data from api');
    }
  }
}
