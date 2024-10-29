import 'package:flutter/material.dart';
import 'package:workshop/exam.dart';
// import 'package:intl/intl.dart'; -> uncomment if needed

class ExamInfo extends StatelessWidget {
  ExamInfo({required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        // TODO: change this in order to display the exam's information
        child: Container());
  }
}
