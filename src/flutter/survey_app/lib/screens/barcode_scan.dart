import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/constants.dart';
import 'package:surveyapp/screens/loading_screen.dart';
import 'package:surveyapp/screens/survey_page.dart';

class BarcodeScanScreen extends StatefulWidget {
  @override
  _BarcodeScanScreenState createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  Future<String> scanQRCode() async {
    var result = await BarcodeScanner.scan();
    String hospitalId = result.rawContent;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(hospitalId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey App'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Scan QR Code',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          color: questionAndButtonBackgroundColor,
          elevation: questionAndButtonElevation,
          shape: RoundedRectangleBorder(
            borderRadius: questionAndButtonBorderRadius,
          ),
          onPressed: () {
            scanQRCode();
          },
        ),
      ),
    );
  }
}
