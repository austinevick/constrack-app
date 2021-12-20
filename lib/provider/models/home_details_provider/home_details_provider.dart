import 'dart:convert';

import 'package:constrack/models/nass_project.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeDetailProvider extends ChangeNotifier {
  //current page for nass projects
  int _currentPageNo = 0;

  /// List of Project Models
  List<ProjectModel> _projectModels = [];
  List<ProjectModel> get projectModel => _projectModels;

  Future<void> fetchProjects(bool isFirstTime) async {
    if (isFirstTime) {
      _currentPageNo = 0;
    } else {
      _currentPageNo = _currentPageNo + 1;
    }

    List<ProjectModel> tempList = await getProjectsData(_currentPageNo);
    if (tempList.isNotEmpty) {
      _projectModels.addAll(tempList);
      notifyListeners();
    }
    return;
  }

  void update(ProjectModel projectModel) {
    _projectModels
        .map((element) =>
            element.id == projectModel.id ? element = projectModel : element)
        .toList();
    notifyListeners();
  }

  Future<List<ProjectModel>> getProjectsData(int pageNo) async {
    final Uri api = Uri.parse(
        "https://constrack.ng/mobile/api/get_all_projects?page=$pageNo");

    /// Api Request
    final response = await http.post(
      api,
      body: json.encode({
        "key": "43730487024f808fcxxxc22424",
      }),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      ProjectMainModel model = projectMainModelFrom(response.body);

      if (model.projects != null && model.projects!.isNotEmpty) {
        return model.projects!;
      }
    }
    return [];
  }
}
