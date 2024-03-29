import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// A StatefulWidget for displaying a generated QR code.
class GeneratedQR extends StatefulWidget {
  /// The data to be encoded into the QR code.
  final myQR;

  /// Constructor for GeneratedQR widget.
  const GeneratedQR(this.myQR);

  @override
  _GeneratedQRState createState() => _GeneratedQRState();
}

/// State class for the GeneratedQR widget.
class _GeneratedQRState extends State<GeneratedQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated QR"),
      ),
      body: Center(
        child: QrImage(
          data: widget.myQR,
          version: QrVersions.auto,
          size: 250.0,
          gapless: false,
        ),
      ),
    );
  }
}
