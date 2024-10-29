import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ExamProvider()), // TODO: create the provider
      ],
      child: MyApp(),
    ),
  );
}

//TODO: inject ExamList into the canvas
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Container(), // maybe here?
    );
  }
}



/*
Some exams if you want to use:

Exam(0, DateTime(2020, 2, 30, 16), DateTime(2020, 2, 30, 17), "PROG", "FEUP");
Exam(1, DateTime(2024, 7, 30, 13), DateTime(2024, 7, 30, 15), "PROG", "FEUP");
Exam(2, DateTime(2023, 1, 12, 08), DateTime(2023, 1, 13, 10), "PROG", "FEUP");
Exam(3, DateTime(2025, 2, 30, 16), DateTime(2025, 2, 30, 17), "PROG", "FEUP");

*/
