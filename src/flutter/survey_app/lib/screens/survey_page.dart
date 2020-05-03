import 'package:flutter/material.dart';
import 'package:surveyapp/components/back_icon_button.dart';
import 'package:surveyapp/components/question_card.dart';
import 'package:surveyapp/constants.dart';
import 'package:surveyapp/components/question_card.dart' show responses;
import 'package:surveyapp/screens/barcode_scan.dart';
import 'package:surveyapp/screens/sending_screen.dart';

int hospitalId;

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
    hospitalId = widget.questions["hospital_id"];
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
        leading: backIconButton(context),
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
        var responseDict = {
          "hospital_id": hospitalId,
          "responses": responses,
        };
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SendingScreen(responseDict: responseDict),
          ),
        );
      },
      child: Text(
        "Submit",
        style: universalTextStyle,
      ),
    );
  }
}
