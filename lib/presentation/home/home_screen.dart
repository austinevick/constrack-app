import 'package:constrack/models/categories.dart';
import 'package:constrack/presentation/home/search_screen/search_screen.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: ConstrackColors.original,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 10),
              Consumer<AuthProvider>(
                builder: (_, authPro, __) {
                  return Text(
                    authPro.userDetails.firstname ?? "Name",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Color(0xff0A1B52),
                    ),
                  );
                },
              ),
            ],
          )),
      body: Column(
        children: [
          CenteredVIew(height: height, width: width),
        ],
      ),
    );
  }
}

class CenteredVIew extends StatelessWidget {
  const CenteredVIew({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: height / 4.9,
                  width: width,
                  color: ConstrackColors.original,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mentor, Track, Report',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Color(0xffffffff),
                            ),
                          ),
                          Text(
                            'Government funded projects',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: ConstrackColors.veryLightOriginal
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: height / 3,
                        width: width / 3.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/checkbadge.png'),
                            fit: BoxFit.contain,
                            scale: 1.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: width,
                  child: ListView.builder(
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      final categoryList = category[index];
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                          id: category[index].id,
                                          title: category[index].title,
                                        )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 130,
                                    width: width,
                                    color: categoryList.color,
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Container(
                                            height: 80,
                                            width: width / 6,
                                            decoration: BoxDecoration(
                                                //color: Colors.red,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        categoryList
                                                            .categoryImage),
                                                    fit: BoxFit.contain)),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(categoryList.title,
                                                style: GoogleFonts.poppins(
                                                    color: ConstrackColors.blue,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(categoryList.subTitle,
                                                style: GoogleFonts.poppins(
                                                  color: categoryList.textColor,
                                                  fontSize: 12.5,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: category.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        );
      },
    );
  }
}
