import 'package:flutter/material.dart';
import 'package:uni/model/entities/exam.dart';

// ignore: must_be_immutable
class ExamFilterMenu extends StatefulWidget {
  Map<String, bool> checkboxes = {};

  @override
  _ExamFilterMenuState createState() => _ExamFilterMenuState();
}

class _ExamFilterMenuState extends State<ExamFilterMenu> {
  @override
  void initState() {
    super.initState();
    widget.checkboxes = checkboxValues();
  }

  Map<String, bool> checkboxValues() {
    final Iterable<String> examTypes = Exam.getExamTypes().keys;
    final Map<String, bool> chekboxes = {/*'Todos': true*/};
    examTypes.forEach((type) => chekboxes[type] = true);
    return chekboxes;
  }

  filterExam(String key, bool value) {
    //if (value) print("ZAAAAAAAAAAAAAAAAS" + key);
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      content: Container(
        height: 300.0,
        width: 200.0,
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return ListView(
            children: widget.checkboxes.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: widget.checkboxes[key],
                onChanged: (bool value) {
                  setState(() {
                    widget.checkboxes[key] = value;
                    filterExam(key, value);
                  });
                },
              );
            }).toList(),
          );
        }),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        showAlertDialog(context);
      },
    );
  }
}
