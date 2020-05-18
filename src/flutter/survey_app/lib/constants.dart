import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const surveyAppUrl = 'http://40.112.176.40/api';
//const surveyAppUrl = 'http://127.0.0.1:5000/api';
const questionAndButtonBackgroundColor = Colors.indigo;
const questionAndButtonElevation = 20.0;
var questionAndButtonBorderRadius = BorderRadius.circular(20.0);
const universalTextStyle = TextStyle(
  fontSize: 20.0,
);
const loadingScreenWidget = SpinKitWanderingCubes(color: Colors.greenAccent, size: 100.0);

List<Shadow> customShadow = <Shadow>[
  Shadow(
    offset: Offset(2.0, 1.0),
    color: Color.fromARGB(255, 0, 0, 0),
  ),
];

var largeTextStyle = TextStyle(fontSize: 50.0, shadows: customShadow);
