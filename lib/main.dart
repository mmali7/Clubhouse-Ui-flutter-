import 'package:flutter/material.dart';
import 'package:frist/constants.dart';
import 'package:frist/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clubhouse ui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.white,
        hintColor: kHintColor,
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.mondaTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
