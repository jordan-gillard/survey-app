import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: RaisedButton(
        child: Text('Scan QR Code'),
        onPressed: () {
          scanQRCode();
        },
      ),
    );
  }
}
