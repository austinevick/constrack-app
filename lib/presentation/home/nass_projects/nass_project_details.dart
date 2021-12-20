import 'package:constrack/models/nass_project.dart';
import 'package:constrack/presentation/widgets/comment.dart';
import 'package:constrack/presentation/widgets/dislike.dart';
import 'package:constrack/presentation/widgets/like.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/models/auth/login/login.model.auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:google_fonts/google_fonts.dart';

class NassProjectDetailsScreen extends StatelessWidget {
  const NassProjectDetailsScreen(
      {Key? key, required this.project, required this.userData})
      : super(key: key);
  final ProjectModel project;
  final LoginModel userData;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        primary: true,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: IconThemeData(
          color: ConstrackColors.original,
        ),
        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: ConstrackColors.original,
              displayColor: ConstrackColors.original,
            ),
        title: Text(
          'Product details',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SafeArea(
              //     child: Row(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).pop();
              //       },
              //       child: Icon(
              //         Icons.arrow_back,
              //         size: 30,
              //         color: Theme.of(context).iconTheme.color,
              //       ),
              //     ),
              //     SizedBox(width: 20),
              //     Text(
              //       'Project details',
              //       style: Theme.of(context).textTheme.headline5,
              //     ),
              //   ],
              // )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        color: ConstrackColors.originalLight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                project.title ?? "Title Here",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    LIKE(project: project, userid: userData.id!),
                    DISLIKE(project: project, userid: userData.id!),
                    COMMENT(project: project),
                  ]),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      FeatherIcons.share2,
                      color: Color(0xff11A9F2),
                      size: 25,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Color(0xffCCE9FF),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Follow Project'),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '${project.userFollowed.toString()} Followers',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                height: 1.5,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffe3e3e3),
              ),
              SizedBox(height: 20),
              Text(
                'Law-Maker',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 15),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            // Padding(
                            //   padding: EdgeInsets.only(left: 15),
                            //   child: ,
                            // )
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Theodore Orji',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Abia Central District (APC)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Location',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 35,
                    color: Colors.red,
                  ),
                  Text(
                    project.location.toString(),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 160,
                  width: width,
                  color: Colors.blueGrey,
                  child: Center(child: Text('MAP IN HERE!!!')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
