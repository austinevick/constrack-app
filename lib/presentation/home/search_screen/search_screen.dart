import 'package:constrack/presentation/home/lawmakers/lawmakers_projects_and_search_screen.dart';
import 'package:constrack/presentation/home/mda_projects/projects_and_search_screen.dart';
import 'package:constrack/presentation/home/nass_projects/nass_projects_and_search_screen.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/models/nass_projects_provider/nass_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, required this.id, required this.title})
      : super(key: key);
  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
          primary: true,
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          iconTheme: IconThemeData(
            color: ConstrackColors.original,
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: ConstrackColors.original,
                displayColor: ConstrackColors.original,
              ),
          title: Text(
            '$id',
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Color(0xffC4C4C4).withOpacity(.16),
                child: TextField(
                  // controller: context.read<Products>().search,
                  onChanged: (query) {
                    context.read<NassProject>().handleSearch(query);
                  },
                  cursorColor: ConstrackColors.original,

                  style: GoogleFonts.poppins(
                    color: ConstrackColors.original,
                  ),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'Type in a keyword to search',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'eg. "repair of roads in Abia"',
              style: GoogleFonts.poppins(
                color: Colors.black45,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Recently Added Projects',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                //color: Colors.amberAccent,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0, top: 5, left: 20.0),
                  child: id == 1
                      ? NassProjectsSearchListView()
                      : id == 2
                          ? MbaProjectsSearchListView()
                          : LawmakersSearchListView(),
                ),
              ),
            ),
          )
          // NassListViewProductScroll()
        ],
      ),
    );
  }
}
