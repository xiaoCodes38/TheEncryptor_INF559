import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:encryption/AESEncryption/AES.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

/// StatefulWidget for scanning QR codes.
class ScanQR extends StatefulWidget {
  /// Constructor for ScanQR widget.
  ScanQR({Key? key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

/// State class for the ScanQR widget.
class _ScanQRState extends State<ScanQR> {
  /// Instance of AESEncryption class for encryption operations.
  AESEncryption encryption = AESEncryption();

  /// Variable to hold the scanned QR data.
  String qrData = "No data found!";

  /// Flag indicating whether QR data is present or not.
  bool hasData = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        qrData = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: Text(
            "Scan your generated QR here",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/Encrypt.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (qrData.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        qrData,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(Icons.launch_outlined),
                        onPressed: hasData
                            ? () async {
                          if (await canLaunch(qrData)) {
                            print(qrData);
                            await launch(qrData);
                          } else {
                            throw 'Could not launch ';
                          }
                        }
                            : null,
                      ),
                    ],
                  ),
                SizedBox(height: 15),
                Container(
                  width: ((MediaQuery.of(context).size.width) / 2) - 45,
                  height: 35,
                  child: ElevatedButton(
                    child: Text(
                      "Scan QR",
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () async {
                      var data = await FlutterBarcodeScanner.scanBarcode(
                          "red", "Cancel", true, ScanMode.QR);
                      setState(() {
                        qrData = data.toString();
                        hasData = true;
                        qrData = encryption
                            .decryptMsg(encryption.getCode(qrData))
                            .toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
