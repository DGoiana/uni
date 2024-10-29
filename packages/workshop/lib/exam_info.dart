import 'package:flutter/material.dart';
import 'package:workshop/exam.dart';
import 'package:intl/intl.dart';

class ExamInfo extends StatelessWidget {
  ExamInfo({required this.exam});

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(exam.id.toString() + ": " + exam.subject),
                Text(exam.faculty)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('yyyy-MM-dd – kk:mm').format(exam.start)),
                SizedBox(
                  width: 25,
                ),
                Text(DateFormat('yyyy-MM-dd – kk:mm').format(exam.finish))
              ],
            )
          ],
        ));
  }
}
