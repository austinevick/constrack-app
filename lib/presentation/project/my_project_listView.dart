import 'package:constrack/presentation/home/nass_projects/nass_project.dart';
import 'package:flutter/material.dart';

class MyProjectListView extends StatelessWidget {
  const MyProjectListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: NassProjects(),
        );
      },
    );
  }
}
