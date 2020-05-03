import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/constants.dart';

class BarcodeScanScreen extends StatefulWidget {
  @override
  _BarcodeScanScreenState createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  void scanQRCode() async {
    var result = await BarcodeScanner.scan();
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
