import 'package:algoselect/constants.dart';
import 'package:flutter/material.dart';

Widget loader(context) {
  return Scaffold(
    backgroundColor: kText,
    body: Center(
      child: Transform.scale(
        scale: 1.0,
        child: CircularProgressIndicator(
          color: kHeader,
          strokeWidth: 2,
        ),
      ),
    ),
  );
}
