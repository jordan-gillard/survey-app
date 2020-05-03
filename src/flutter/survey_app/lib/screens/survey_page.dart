import 'package:flutter/material.dart';
import 'package:surveyapp/components/question_card.dart';
import 'package:surveyapp/constants.dart';

class SurveyPage extends StatefulWidget {
  final questions;

  SurveyPage({this.questions});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  String hospitalName;
  List<Widget> questions = [];

  @override
  void initState() {
    super.initState();

    hospitalName = widget.questions['hospital_name'];
    List questionsDicts = widget.questions['questions'];
    questionsDicts.forEach(
      (questionDict) {
        QuestionCard question = QuestionCard(questionDict);
        questions.add(question);
      },
    );
    questions.add(SubmitButton());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospitalName),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: questions,
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: questionAndButtonBackgroundColor,
      elevation: questionAndButtonElevation,
      shape: RoundedRectangleBorder(
        borderRadius: questionAndButtonBorderRadius,
      ),
      onPressed: () {
        print("Submit button pressed!");
      },
      child: Text(
        "Submit",
        style: universalTextStyle,
      ),
    );
  }
}
