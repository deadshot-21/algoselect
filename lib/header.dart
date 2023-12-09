import 'package:algoselect/constants.dart';
import 'package:algoselect/questions.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.question, this.answer});
  final String? question;
  final String? answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHeader,
      appBar: AppBar(
          toolbarHeight: 95,
          centerTitle: true,
          backgroundColor: kHeader,
          title: Image.asset('${imagePath}logo.png',
              width: MediaQuery.of(context).size.width * 0.38)),
      body: Questions(
        question: question,
        answer: answer,
      ),
    );
  }
}
