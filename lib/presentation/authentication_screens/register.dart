import 'package:another_flushbar/flushbar.dart';
import 'package:constrack/presentation/authentication_screens/login.dart';
import 'package:constrack/presentation/widgets/theme.dart';
import 'package:constrack/provider/authentication.dart';
import 'package:constrack/provider/response/response.db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> _authData = {
    'firstname': '',
    'lastname': '',
    'email': '',
    'pword': '',
    'phone': '',
    'key': '43730487024f808fcxxxc22424',
  };
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ConstrackColors.original,
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (__, authPro, ___) {
            if (authPro.isLoading) {
              return Center(
                child: SpinKitFadingGrid(
                  color: ConstrackColors.gold,
                ),
              );
            } else {
              return SingleChildScrollView(
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
                            'Hello',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            'Create Account',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(height: 30),
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
                                    child: Image.asset(
                                        'assets/images/facebook.png'),
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
                                    child:
                                        Image.asset('assets/images/google.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
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
                                  onSaved: (value) =>
                                      _authData['firstname'] = value!,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.person_outlined,
                                        color: ConstrackColors.original,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffE0E7FF),
                                              width: 2.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'First Name',
                                      hintStyle: GoogleFonts.poppins(
                                          color: ConstrackColors.original)),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  style: GoogleFonts.poppins(
                                      color: ConstrackColors.original),
                                  onSaved: (value) =>
                                      _authData['lastname'] = value!,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.person_outlined,
                                        color: ConstrackColors.original,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffE0E7FF),
                                              width: 2.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Last Name',
                                      hintStyle: GoogleFonts.poppins(
                                          color: ConstrackColors.original)),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  style: GoogleFonts.poppins(
                                      color: ConstrackColors.original),
                                  onSaved: (value) =>
                                      _authData['email'] = value!,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
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
                                              color: Color(0xffE0E7FF),
                                              width: 2.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Email',
                                      hintStyle: GoogleFonts.poppins(
                                          color: ConstrackColors.original)),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  obscureText: true,
                                  style: GoogleFonts.poppins(
                                      color: ConstrackColors.original),
                                  onSaved: (value) =>
                                      _authData['pword'] = value!,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
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
                                              color: Color(0xffE0E7FF),
                                              width: 2.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.poppins(
                                          color: ConstrackColors.original)),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  style: GoogleFonts.poppins(
                                      color: ConstrackColors.original),
                                  onSaved: (value) =>
                                      _authData['phone'] = value!,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
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
                                              color: Color(0xffE0E7FF),
                                              width: 2.0)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Phone Number',
                                      hintStyle: GoogleFonts.poppins(
                                          color: ConstrackColors.original)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      ConstrackColors.gold),
                                ),
                                onPressed: tapRegister,
                                child: Text(
                                  'Create Account',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text('Login Here',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: ConstrackColors.gold,
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
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> tapRegister() async {
    print('Registered');

    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      //for testing purposes............
      print(_authData['firstname']);
      print(_authData['lastname']);
      print(_authData['email']);
      print(_authData['pword']);
      print(_authData['phone']);
      print(_authData['key']);

      final String result =
          await Provider.of<AuthProvider>(context, listen: false).signup(
        firstname: _authData['firstname'],
        lastname: _authData['lastname'],
        email: _authData['email'],
        pword: _authData['pword'],
        phone: _authData['phone'],
        key: _authData['key'],
      );

      /// Check the result and show crospoding message
      if (result == ResponseDB.empty) {
        Flushbar(
          title: "Registration Failed. Try Again",
          duration: Duration(seconds: 3),
          messageText: Text(''),
        )..show(context);
      } else if (result == ResponseDB.failed) {
        Flushbar(
          title: "Oops! Getting Error",
          messageText: Text(''),
          duration: Duration(seconds: 3),
        )..show(context);
      } else if (result == ResponseDB.success) {
        Flushbar(
          title: "Signup Success. User Credential Status",
          messageText: Text(''),
          duration: Duration(seconds: 3),
        )..show(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
      }
    } else {
      Flushbar(
        title: "Invalid form",
        message: "Please complete the form properly",
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }
}
