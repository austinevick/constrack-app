import 'dart:convert';

import 'package:constrack/models/nass_project.dart';
import 'package:constrack/util/constants.dart';
import 'package:constrack/util/enum.dart';
import 'package:constrack/util/enum_parsing.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class NassProject extends ChangeNotifier {
  List<ProjectModel> _projects = [];
  List<ProjectModel> _searchprojectModel = [];
  List<ProjectModel> _mbaSearchprojectModel = [];
  List<ProjectModel> _projectSearchModel = [];
  static const String baseUrl = 'https://constrack.ng/mobile/api';

  List<ProjectModel> get projects {
    return [..._projects];
  }

  void addProject(ProjectModel project) {
    _projects.add(project);
    notifyListeners();
  }

  void removeProject(ProjectModel project) {
    _projects.remove(project);
    notifyListeners();
  }

  Future<bool> like(ProjectModel project, String userid) async {
    final api = Uri.parse(
        "https://constrack.ng/mobile/api/like_project?key=$kApiKey&project_id=${project.id}&user_id=$userid");

    /// Api Request
    final response = await http.get(api);

    if (response.statusCode == 200) {
      return ResponseEnumParsing.fromString(
              jsonDecode(response.body)["message"]) ==
          Response.successful;
    } else {
      // throw Exception('Failed to load data from api');
      return false;
    }
  }

  Future<bool> dislike(ProjectModel project, String userid) async {
    final api = Uri.parse(
        "https://constrack.ng/mobile/api/unlike_project?key=$kApiKey&project_id=${project.id}&user_id=$userid");

    /// Api Request
    final response = await http.get(api);

    if (response.statusCode == 200) {
      return ResponseEnumParsing.fromString(
              jsonDecode(response.body)["message"]) ==
          Response.successful;
    } else {
      // throw Exception('Failed to load data from api');
      return false;
    }
  }

  Future<List<ProjectModel>> handleSearch(String query) async {
    final Uri api = Uri.parse("$baseUrl/search_reps?key=$kApiKey");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      _searchprojectModel = ProjectModel.fromJsonList(response.body);
      return _searchprojectModel;
    } else {
      // throw Exception('Failed to load data from api');
      return [];
    }
  }

  Future<List<ProjectModel>> handleMBASearch(String query) async {
    final Uri api = Uri.parse("$baseUrl/search_reps?key=$kApiKey");
    final response = await http.get(api);

    if (response.statusCode == 200) {
      _mbaSearchprojectModel = ProjectModel.fromJsonList(response.body);
      return _mbaSearchprojectModel;
    } else {
      // throw Exception('Failed to load data from api');
      return [];
    }
  }

  Future<List<ProjectModel>> handleProjectSearch(String query) async {
    final Uri api = Uri.parse("$baseUrl/search_reps?key=$kApiKey");
    final response = await http.post(api, body: {
      "state": 0,
      "type": 1,
      "party": "",
      "searchKey": "",
      "key": kApiKey,
    });

    if (response.statusCode == 200) {
      _projectSearchModel = ProjectModel.fromJsonList(response.body);
      return _projectSearchModel;
    } else {
      // throw Exception('Failed to load data from api');
      return [];
    }
  }
}
