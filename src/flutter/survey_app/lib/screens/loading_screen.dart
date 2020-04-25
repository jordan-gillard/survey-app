import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:surveyapp/get_questions.dart';
import 'package:surveyapp/screens/survey_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void getQuestions() async {
    var questions = await Questions().getQuestions(1);  // TODO: get hospital id from front page

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SurveyPage(questions: questions)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(color: Colors.greenAccent, size: 100.0),
      ),
    );
  }
}