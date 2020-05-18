import 'package:flutter/material.dart';
import 'package:surveyapp/screens/barcode_scan.dart';
import 'package:surveyapp/screens/loading_screen.dart';
import 'package:surveyapp/screens/sending_screen.dart';
import 'package:surveyapp/screens/survey_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BarcodeScanScreen(),
//        '/': (context) => LoadingScreen(2),
        '/survey': (context) => SurveyPage(),
        '/sendingScreen': (context) => SendingScreen()
      },
      theme: ThemeData.dark(),
    );
  }
}
