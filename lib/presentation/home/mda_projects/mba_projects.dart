import 'package:flutter/material.dart';

import 'mba_projects_view_details.dart';

class MBAsProjects extends StatelessWidget {
  const MBAsProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        //TODO:  the desc. screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (cxt) => MbaProjectsViewDetails()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 100,
              width: width,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 8, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 90,
                                width: width / 4,
                                decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    image: DecorationImage(
                                        image: NetworkImage('url'))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text(
                                'Theodore Orji',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_right,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
