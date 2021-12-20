import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/authentication.dart';
import 'package:constrack/provider/models/home_details_provider/home_details_provider.dart';
import 'package:constrack/provider/models/nass_projects_provider/nass_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider<HomeDetailProvider>(
            create: (_) => HomeDetailProvider()),
        ChangeNotifierProvider<NassProject>(
          create: (_) => NassProject(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentItem = names[0].name!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(
                    names.length,
                    (i) => MaterialButton(
                          onPressed: () {},
                          child: SizedBox(
                            height: 80,
                            child: Card(
                              color: Colors.red,
                              child: Center(child: Text(names[i].name!)),
                            ),
                          ),
                        )),
              ),
            ),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => Container(),
                );
              },
              child: Container(
                height: 60,
                color: Colors.blue,
                width: double.infinity,
                child: Center(child: Text(currentItem)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Names> names = [
  Names('1', 'Orange'),
  Names('2', 'Rice'),
  Names('3', 'Mango'),
  Names('4', 'Beans'),
  Names('5', 'Computer'),
  Names('6', 'Phone'),
  Names('7', 'Earphone'),
  Names('8', 'book'),
  Names('6', 'Phone'),
  Names('7', 'Earphone'),
  Names('8', 'book'),
];

class Names {
  final String? id;
  final String? name;

  Names(this.id, this.name);
}
