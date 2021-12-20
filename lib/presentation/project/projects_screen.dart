import 'package:constrack/presentation/project/my_project_listView.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/models/nass_projects_provider/nass_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class MyProjectS extends StatelessWidget {
  const MyProjectS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Hi Gift',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Color(0xff0A1B52),
                ),
              ),
            ],
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
                    context.read<NassProject>().handleProjectSearch(query);
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
              'Followed Projects',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Container(
              height: 1.8,
              width: 120,
              color: ConstrackColors.original,
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
                  child: MyProjectListView(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
