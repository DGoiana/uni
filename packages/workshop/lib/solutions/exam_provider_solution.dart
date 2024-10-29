import 'package:flutter/material.dart';
import 'package:workshop/exam.dart';

class ExamProvider extends ChangeNotifier {
  List<Exam> _exams = [
    Exam(0, DateTime(2020, 2, 30, 16), DateTime(2020, 2, 30, 17), "PROG",
        "FEUP"),
    Exam(
        1, DateTime(2024, 7, 30, 13), DateTime(2024, 7, 30, 15), "PROG", "FEUP")
  ];

  List<Exam> get exams => _exams;

  void addExam(Exam exam) {
    _exams.add(exam);
    notifyListeners();
  }

  void removeExam(Exam exam) {
    _exams.remove(exam);
    notifyListeners();
  }
}
