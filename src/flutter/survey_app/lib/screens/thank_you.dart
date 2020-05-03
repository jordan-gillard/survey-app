import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thank you!',
              style: TextStyle(fontSize: 50.0, shadows: customShadow),
            ),
            Text(
              'Your response has been submitted successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, shadows: customShadow),
            )
          ],
        ),
      ),
    );
  }
}

List<Shadow> customShadow = <Shadow>[
  Shadow(
    offset: Offset(2.0, 1.0),
    color: Color.fromARGB(255, 0, 0, 0),
  ),
];
