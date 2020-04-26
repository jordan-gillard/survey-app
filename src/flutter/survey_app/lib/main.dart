import 'package:flutter/material.dart';
import 'package:surveyapp/screens/loading_screen.dart';
import 'package:surveyapp/screens/survey_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoadingScreen(),
        '/survey': (context) => SurveyPage()
      },
      theme: ThemeData.dark(),
    );
  }
}
