import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LawmakersSearchListView extends StatelessWidget {
  const LawmakersSearchListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, lawPro, child) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        },
      );
    });
  }
}
