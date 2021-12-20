import 'package:constrack/models/nass_project.dart';
import 'package:constrack/presentation/home/nass_projects/nass_project_details.dart';
import 'package:constrack/presentation/widgets/comment.dart';
import 'package:constrack/presentation/widgets/dislike.dart';
import 'package:constrack/presentation/widgets/like.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/authentication.dart';
import 'package:constrack/provider/models/auth/login/login.model.auth.dart';
import 'package:constrack/provider/models/home_details_provider/home_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NassProjects extends StatefulWidget {
  const NassProjects({Key? key}) : super(key: key);

  @override
  _NassProjectsState createState() => _NassProjectsState();
}

class _NassProjectsState extends State<NassProjects> {
  late final LoginModel userData;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      HomeDetailProvider pro = context.read<HomeDetailProvider>();
      //TODO: get user data
      userData = context.read<AuthProvider>().userDetails;
      if (pro.projectModel.isNotEmpty) {
        context.read<HomeDetailProvider>().fetchProjects(false);
      } else {
        context.read<HomeDetailProvider>().fetchProjects(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    return SizedBox(
      width: width,
      child: Consumer<HomeDetailProvider>(
        builder: (context, homePro, child) {
          return homePro.projectModel.isNotEmpty
              ? SmartRefresher.builder(
                  onLoading: () async {
                    _refreshController.requestLoading();
                    await homePro.fetchProjects(false);
                    _refreshController.loadComplete();
                  },
                  enablePullDown: false,
                  enablePullUp: true,
                  controller: _refreshController,
                  builder: (_, __) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homePro.projectModel.length,
                      itemBuilder: (___, int index) {
                        print("Total Projects: ${homePro.projectModel.length}");
                        return ProjectDetailCard(
                          width: width,
                          project: homePro.projectModel[index],
                          userData: userData,
                        );
                      },
                    );
                  },
                )
              : Center(
                  child: Text("No Project available"),
                );
        },
      ),
    );
  }
}

class ProjectDetailCard extends StatelessWidget {
  const ProjectDetailCard({
    Key? key,
    required this.width,
    required this.project,
    required this.userData,
  }) : super(key: key);

  final double width;
  final ProjectModel project;
  final LoginModel userData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        //TODO:  the desc. screen
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (cxt) => NassProjectDetailsScreen(
                  project: project,
                  userData: userData,
                )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 165,
                  width: width,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: ConstrackColors.originalLight,
                    image: project.photos != null && project.photos!.isNotEmpty
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(project.photos!.first),
                          )
                        : null,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Color(0xff11A9F2),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                                child: Text(
                                  'New',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                project.title ?? "Title Here",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    LIKE(project: project, userid: userData.id!),
                    DISLIKE(project: project, userid: userData.id!),
                    COMMENT(project: project),
                  ]),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xff11A9F2),
                            width: 1,
                          )),
                      child: Icon(
                        FeatherIcons.arrowRight,
                        color: Color(0xff11A9F2),
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
