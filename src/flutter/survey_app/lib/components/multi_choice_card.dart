import 'package:flutter/material.dart';

class MultipleChoiceCard extends StatelessWidget {
  MultipleChoiceCard({@required this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
