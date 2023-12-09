import 'package:algoselect/header.dart';
import 'package:algoselect/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlgoSelect',
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: const Header(),
      debugShowCheckedModeBanner: false,
    );
  }
}
