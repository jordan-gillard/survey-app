import 'package:flutter/material.dart';

bool _isSelected = false;

class QuestionCard extends StatefulWidget {
  final questionDict;

  QuestionCard(this.questionDict);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String questionText;
  int selectedId;
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
      ),
    );
    questionDisplay.add(questionTextWidget);

    if (widget.questionDict['multiple_choice']) {
      List options = widget.questionDict['options'];

      options.forEach(
        (option) {
          String optionText = option['text'];
          int optionId = option['option_id'];
          Widget optionCheckbox = customCheckboxListTile(optionText, optionId);
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

class customCheckboxListTile extends StatefulWidget {
  String text;
  int optionId;

  customCheckboxListTile(this.text, this.optionId);

  @override
  _customCheckboxListTileState createState() => _customCheckboxListTileState();
}

class _customCheckboxListTileState extends State<customCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _isSelected,
      selected: _isSelected,
      title: Text(widget.text),
      secondary: Icon(Icons.adjust),
      onChanged: (newVal) {
        setState(() {
          _isSelected = newVal;
//          selectedId = optionId;  # TODO: pass state upwards
        });
      },
    );
    ;
  }
}
