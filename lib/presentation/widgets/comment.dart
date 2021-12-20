import 'package:constrack/models/nass_project.dart';
import 'package:flutter/material.dart';

class COMMENT extends StatelessWidget {
  const COMMENT({Key? key, required this.project}) : super(key: key);
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.message_sharp,
            size: 25,
            color: Color(0xffc4c4c4),
          ),
        ),
        Text(
          project.commentsNo.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
