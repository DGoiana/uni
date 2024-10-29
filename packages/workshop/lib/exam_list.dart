import 'package:flutter/material.dart';

class ExamListSolution extends StatelessWidget {
  ExamListSolution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam List')),

      // TODO: display all the exams from the provider's exam list
      body: Container(),

      floatingActionButton: FloatingActionButton(
        // TODO: add an exam to the provider when the button is pressed
        onPressed: () {},

        child: Icon(Icons.add),
      ),
    );
  }
}
