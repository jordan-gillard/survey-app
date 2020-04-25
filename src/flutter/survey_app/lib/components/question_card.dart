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
    questionDisplay.add(Text(questionText));

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
              selectedId = option['id'];
            },
          );

          questionDisplay.add(optionCheckbox);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: questionDisplay,
      ),
    );
  }
}
