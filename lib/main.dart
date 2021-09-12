import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './views/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme
      )),
      home: HomePage(),
    );
  }
}
