import 'package:constrack/models/nass_project.dart';
import 'package:constrack/provider/models/home_details_provider/home_details_provider.dart';
import 'package:constrack/provider/models/nass_projects_provider/nass_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class LIKE extends StatelessWidget {
  const LIKE({Key? key, required this.project, required this.userid})
      : super(key: key);
  final ProjectModel project;
  final String userid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            project.userLiked =
                await context.read<NassProject>().like(project, userid) ? 1 : 0;
            project.likesNo = project.likesNo! + 1;
            context.read<HomeDetailProvider>().update(project);
          },
          icon: Icon(
            project.userLiked == 1
                ? Icons.thumb_up_alt
                : Icons.thumb_up_alt_outlined,
            size: 25,
            color: Colors.green,
          ),
        ),
        Text(
          project.likesNo.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
