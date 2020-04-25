import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  final questions;

  SurveyPage({this.questions});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  void initState() {
    super.initState();
    print(widget.questions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey!'),
      ),
    );
  }
}
