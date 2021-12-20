import 'package:another_flushbar/flushbar.dart';
import 'package:constrack/presentation/authentication_screens/register.dart';
import 'package:constrack/presentation/page_navigator.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/authentication.dart';
import 'package:constrack/provider/models/auth/login/login.model.auth.dart';
import 'package:constrack/provider/response/response.db.dart';
import 'package:constrack/provider/storage/login/login.storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _authData = {
    'email': '',
    'pword': '',
    'key': '43730487024f808fcxxxc22424',
  };

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      Map<String, String> details = await LoginLocalDB().getCredentials;

      if (details[LoginLocalDB.uidKey]!.isNotEmpty &&
          details[LoginLocalDB.pwdKey]!.isNotEmpty) {
        /// Pass The Details to _authData map
        _authData['email'] = details[LoginLocalDB.uidKey]!;
        _authData['pword'] = details[LoginLocalDB.pwdKey]!;

        /// Start Login Function
        tapLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ConstrackColors.original,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: height / 1.02,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/circle1.png'),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: height / 5.8,
                child: Container(
                  height: height / 1.6,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/circle2.png'),
                          fit: BoxFit.fill)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello\nLogin Now',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Using Socials',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffffff),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/facebook.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      'or using email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffffff),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: GoogleFonts.poppins(
                                color: ConstrackColors.original),
                            onSaved: (value) => _authData['email'] = value!,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: ConstrackColors.original,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ConstrackColors.original
                                        .withOpacity(0.7),
                                    width: 4.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E7FF), width: 2.0)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                hintText: 'Enter your email',
                                hintStyle: GoogleFonts.poppins(
                                    color: ConstrackColors.original)),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            style: GoogleFonts.poppins(
                                color: ConstrackColors.original),
                            onSaved: (value) => _authData['pword'] = value!,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock_outlined,
                                  color: ConstrackColors.original,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ConstrackColors.original
                                        .withOpacity(0.7),
                                    width: 4.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffE0E7FF), width: 2.0)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                    color: ConstrackColors.original)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Forgot password? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: "Reset",
                            style: GoogleFonts.poppins(
                              color: ConstrackColors.gold,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(ConstrackColors.gold),
                          ),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              tapLogin();
                            } else {
                              Flushbar(
                                title: "Invalid form",
                                message: "Please complete the form properly",
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          },
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => RegisterScreen()));
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => PageNavigatorScreen()));
                          // context.read<AuthProvider>().data(pageNo: 50);

                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already Have An Account?  ',
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text('Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: ConstrackColors.original,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> tapLogin() async {
    print('Registered');

    //for testing purposes............
    print(_authData['email']);
    print(_authData['pword']);
    print(_authData['key']);

    final LoginModel result = await context.read<AuthProvider>().signin(
          _authData['email'],
          _authData['pword'],
          _authData['key'],
        );

    /// Check the result and show crospoding message
    if (result.message == ResponseDB.failed) {
      Flushbar(
        title: "Login Failed. Try Again",
        duration: Duration(seconds: 3),
        messageText: Text(''),
      )..show(context);
    } else if (result.message == ResponseDB.empty) {
      Flushbar(
        title: "Oops! Getting Error",
        messageText: Text(''),
        duration: Duration(seconds: 3),
      )..show(context);
    } else if (result.message == ResponseDB.success) {
      /// Store Login Details
      await LoginLocalDB().storeCredentails(
        uid: _authData['email']!,
        pwd: _authData['pword']!,
      );

      /// Show Toast & Navigate to other screen
      Flushbar(
        title: "Sign-In Success. User Credential Status",
        messageText: Text(''),
        duration: Duration(seconds: 3),
      )..show(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => PageNavigatorScreen()));
    }
  }
}
