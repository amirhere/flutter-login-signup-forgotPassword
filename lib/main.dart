import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter_login_signup/src/Pages/welcomePage.dart';
import 'package:flutter_login_signup/src/Pages/forgotPasswordPage.dart';

void main(){
    runApp(
        MyApp()
    );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         toggleableActiveColor: Color(0xFF573555),
         primarySwatch: Colors.lightBlue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
         textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
           bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
         ),
      ),
      debugShowCheckedModeBanner: true,
      home: WelcomePage(),
    );
  }
}
