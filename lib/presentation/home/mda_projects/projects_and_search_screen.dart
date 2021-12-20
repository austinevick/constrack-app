import 'package:flutter/material.dart';

import 'mba_projects.dart';

class MbaProjectsSearchListView extends StatelessWidget {
  const MbaProjectsSearchListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: MBAsProjects(),
        );
      },
    );
  }
}
