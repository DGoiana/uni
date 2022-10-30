import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/providers/exam_provider.dart';
import 'package:uni/utils/drawer_items.dart';
import 'package:uni/view/common_widgets/date_rectangle.dart';
import 'package:uni/view/common_widgets/generic_card.dart';
import 'package:uni/view/common_widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/common_widgets/row_container.dart';
import 'package:uni/view/exams/widgets/exam_row.dart';
import 'package:uni/view/exams/widgets/exam_title.dart';

/// Manages the exam card section inside the personal area.
class ExamCard extends GenericCard {
  ExamCard({Key? key}) : super(key: key);

  const ExamCard.fromEditingInformation(
      Key key, bool editingMode, Function()? onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  String getTitle() => 'Exames';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/${DrawerItem.navExams.title}');

  static getExamCardColor(BuildContext context, Exam exam) {
    return exam.isHighlighted()
        ? Theme.of(context).backgroundColor
        : Theme.of(context).hintColor;
  }

  /// Returns a widget with all the exams card content.
  ///
  /// If there are no exams, a message telling the user
  /// that no exams exist is displayed.
  @override
  Widget buildCardContent(BuildContext context) {
    return Consumer<ExamProvider>(builder: (context, examProvider, _) {
      final filteredExams = examProvider.getFilteredExams();
      return RequestDependentWidgetBuilder(
        context: context,
        status: examProvider.status,
        contentGenerator: generateExams,
        content: filteredExams,
        contentChecker: filteredExams.isNotEmpty,
        onNullContent: Center(
          child: Text('Não existem exames para apresentar',
              style: Theme.of(context).textTheme.headline6),
        ),
      );
    });
  }

  /// Returns a widget with all the exams.
  Widget generateExams(exams, context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: getExamRows(context, exams),
    );
  }

  /// Returns a list of widgets with the primary and secondary exams to
  /// be displayed in the exam card.
  List<Widget> getExamRows(context, exams) {
    final List<Widget> rows = <Widget>[];
    for (int i = 0; i < 1 && i < exams.length; i++) {
      rows.add(createRowFromExam(context, exams[i]));
    }
    if (exams.length > 1) {
      rows.add(Container(
        margin:
            const EdgeInsets.only(right: 80.0, left: 80.0, top: 15, bottom: 7),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.5, color: Theme.of(context).dividerColor))),
      ));
    }
    for (int i = 1; i < 4 && i < exams.length; i++) {
      rows.add(createSecondaryRowFromExam(context, exams[i]));
    }
    return rows;
  }

  /// Creates a row with the closest exam (which appears separated from the
  /// others in the card).
  Widget createRowFromExam(context, Exam exam) {
    return Column(children: [
      DateRectangle(date: '${exam.weekDay}, ${exam.day} de ${exam.month}'),
      RowContainer(
        color: getExamCardColor(context, exam),
        child: ExamRow(
          subject: exam.subject,
          rooms: exam.rooms,
          begin: exam.begin,
          end: exam.end,
          type: exam.examType,
          date: exam.date,
          teacher: '',
        ),
      ),
    ]);
  }

  /// Creates a row for the exams which will be displayed under the closest
  /// date exam with a separator between them.
  Widget createSecondaryRowFromExam(context, exam) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: RowContainer(
        color: getExamCardColor(context, exam),
        child: Container(
          padding: const EdgeInsets.all(11),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  exam.day + ' de ' + exam.month,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ExamTitle(
                    subject: exam.subject,
                    type: exam.examType,
                    reverseOrder: true)
              ]),
        ),
      ),
    );
  }
}
