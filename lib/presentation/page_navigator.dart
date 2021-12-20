import 'package:constrack/presentation/home/home_screen.dart';
import 'package:constrack/presentation/project/projects_screen.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNavigatorScreen extends StatefulWidget {
  const PageNavigatorScreen({Key? key}) : super(key: key);

  @override
  _PageNavigatorScreenState createState() => _PageNavigatorScreenState();
}

class _PageNavigatorScreenState extends State<PageNavigatorScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                HomeScreen(),
                MyProjectS(),
                Text('Current Index3: $currentIndex'),
              ],
            ),
          ),
          _DeliveryNavigationBar(
              index: currentIndex,
              onIndexSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              })
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  const _DeliveryNavigationBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);
  final int index;
  final ValueChanged<int> onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => onIndexSelected(0),
                      icon: Icon(
                        Icons.home,
                        color: index == 0
                            ? ConstrackColors.blue
                            : Color(0xffADB7DB),
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: index == 0
                            ? ConstrackColors.blue
                            : Color(0xffADB7DB),
                      ),
                    )
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => onIndexSelected(1),
                      icon: Icon(
                        Icons.folder_open,
                        color: index == 1
                            ? ConstrackColors.blue
                            : Color(0xffADB7DB),
                      ),
                    ),
                    Text(
                      'Projects',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: index == 1
                            ? ConstrackColors.blue
                            : Color(0xffADB7DB),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => onIndexSelected(2),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () => onIndexSelected(2),
                      icon: Icon(
                        Icons.person_outline,
                        color: index == 2
                            ? ConstrackColors.blue
                            : Color(0xffADB7DB),
                      ),
                    ),
                    Text(
                      'profile',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: index == 2
                            ? ConstrackColors.blue
                            : Color(0xffADB7DB),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
