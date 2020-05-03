import 'package:flutter/material.dart';
import 'package:surveyapp/components/back_icon_button.dart';
import 'package:surveyapp/constants.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey submitted successfully!'),
        leading: backIconButton(context)
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thank you!',
              style: largeTextStyle,
            ),
            Text(
              'Your response has been submitted successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, shadows: customShadow),
            ),
          ],
        ),
      ),
    );
  }
}
