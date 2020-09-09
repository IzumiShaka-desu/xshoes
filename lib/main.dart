import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xshoes/screens/onboard.dart';
import 'package:xshoes/screens/page.dart';
import 'package:xshoes/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
