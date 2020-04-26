import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final questionDict;

  QuestionCard(this.questionDict);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String questionText;
  int selectedId;
  bool _isSelected = false;
  List<Widget> questionDisplay = [];

  @override
  void initState() {
    super.initState();
    buildQuestionCard();
  }

  void buildQuestionCard() {
    questionText = widget.questionDict['question'];
    Widget questionTextWidget = Padding(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 30.0),
        child: Text(
      questionText,
      style: TextStyle(
        fontSize: 20.0,
      ),
    )
    );
    questionDisplay.add(questionTextWidget);

    if (widget.questionDict['multiple_choice']) {
      List options = widget.questionDict['options'];

      options.forEach(
        (option) {
          CheckboxListTile optionCheckbox = CheckboxListTile(
            value: _isSelected,
            title: Text(option['text']),
            secondary: Icon(Icons.adjust),
            onChanged: (newVal) {
              _isSelected = !_isSelected;
              selectedId = option['option_id'];
            },
          );

          questionDisplay.add(optionCheckbox);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.indigo,
        elevation: 20.0,
        child: Column(
          children: questionDisplay,
        ),
      ),
    );
  }
}
