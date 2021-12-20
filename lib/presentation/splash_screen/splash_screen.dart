import 'package:constrack/presentation/authentication_screens/login.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/building.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: height,
            width: width,
            color: ConstrackColors.original.withOpacity(.9),
            child: Center(
              child: Container(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/constrack.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
