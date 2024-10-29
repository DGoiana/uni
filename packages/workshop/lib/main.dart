import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: IntrinsicHeight(
              child: IntrinsicWidth(
                  child: Container() // you maybe want to change this...,
                  ),
            ),
          ),
        ));
  }
}



/*
Some exams if you want to use:

Exam(0, DateTime(2020, 2, 30, 16), DateTime(2020, 2, 30, 17), "PROG", "FEUP");
Exam(1, DateTime(2024, 7, 30, 13), DateTime(2024, 7, 30, 15), "PROG", "FEUP");
Exam(2, DateTime(2023, 1, 12, 08), DateTime(2023, 1, 13, 10), "PROG", "FEUP");
Exam(3, DateTime(2025, 2, 30, 16), DateTime(2025, 2, 30, 17), "PROG", "FEUP");

*/
