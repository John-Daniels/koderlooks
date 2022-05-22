import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koderlooks/pages/travel/travel.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        // iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const TravelPage(),
    );
  }
}
