import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const surveyAppUrl = 'http://localhost:5000/api/hospitals';
const questionAndButtonBackgroundColor = Colors.indigo;
const questionAndButtonElevation = 20.0;
var questionAndButtonBorderRadius = BorderRadius.circular(20.0);
const universalTextStyle = TextStyle(
  fontSize: 20.0,
);
const loadingScreenWidget = SpinKitWanderingCubes(color: Colors.greenAccent, size: 100.0);