import 'package:flutter/material.dart';
import 'package:workshop/exam.dart';
import 'package:workshop/exam_info.dart';
import 'package:workshop/solutions/exam_provider_solution.dart';
import 'package:provider/provider.dart';

class ExamListSolution extends StatelessWidget {
  ExamListSolution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam List')),
      body: Consumer<ExamProvider>(builder: (context, _examProvider, child) {
        return ListView.builder(
          itemCount: _examProvider.exams.length,
          itemBuilder: (context, index) {
            return ExamInfo(exam: _examProvider.exams[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final examProvider =
              Provider.of<ExamProvider>(context, listen: false);
          examProvider.addExam(Exam(3, DateTime(2025, 2, 30, 16),
              DateTime(2025, 2, 30, 17), "PROG", "FEUP")); // just an example
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
