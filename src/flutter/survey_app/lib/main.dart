import 'package:flutter/material.dart';
import 'package:surveyapp/screens/loading_screen.dart';
import 'package:surveyapp/screens/sending_screen.dart';
import 'package:surveyapp/screens/survey_page.dart';
import 'package:surveyapp/screens/thank_you.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoadingScreen(),
//        '/': (context) => ThankYouScreen(),
        '/survey': (context) => SurveyPage(),
        '/sendingScreen': (context) => SendingScreen()
      },
      theme: ThemeData.dark(),
    );
  }
}
