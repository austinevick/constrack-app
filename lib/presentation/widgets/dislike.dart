import 'package:constrack/models/nass_project.dart';
import 'package:constrack/provider/models/home_details_provider/home_details_provider.dart';
import 'package:constrack/provider/models/nass_projects_provider/nass_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DISLIKE extends StatelessWidget {
  const DISLIKE({Key? key, required this.project, required this.userid})
      : super(key: key);
  final ProjectModel project;
  final String userid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            project.userDisliked =
                await context.read<NassProject>().dislike(project, userid)
                    ? 1
                    : 0;
            project.dislikesNo = project.likesNo! + 1;
            context.read<HomeDetailProvider>().update(project);
          },
          icon: Icon(
            project.userDisliked == 1
                ? Icons.thumb_down_alt
                : Icons.thumb_down_alt_outlined,
            size: 25,
            color: Colors.red,
          ),
        ),
        Text(
          project.dislikesNo.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
