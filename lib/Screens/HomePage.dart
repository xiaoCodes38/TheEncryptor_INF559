import 'package:flutter/material.dart';
import 'package:encryption/AESEncryption/AES.dart';
import 'package:encryption/QR%20Scanner/ScanQR.dart';
import 'package:encryption/QR%20Generator/QRGenerator.dart';

/// StatefulWidget for the home page.
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// State class for the home page.
class _MyHomePageState extends State<MyHomePage> {
  /// Instance of AESEncryption class for encryption operations.
  AESEncryption encryption = AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The ENCRYPTOR",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildGenerateQRBtn(context),
                        buildScanQRBtn(context),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Instructions:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "1. Click on 'Generate QR' and enter text to encrypt.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "2. A QR code will be generated.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "3. Click on 'Scan QR' and scan the QR code to get the decrypted text.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "4. What's the catch? Try scanning the generated QR code in any other device or outside the app.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Builds the button for generating QR codes.
Widget buildGenerateQRBtn(BuildContext context) => Container(
  width: MediaQuery.of(context).size.width / 2 - 45,
  height: 50,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QRGenerator()),
      );
    },
    child: Text("Generate QR", style: TextStyle(fontSize: 17)),
  ),
);

/// Builds the button for scanning QR codes.
Widget buildScanQRBtn(BuildContext context) => Container(
  width: MediaQuery.of(context).size.width / 2 - 45,
  height: 50,
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScanQR()),
      );
    },
    child: Text("Scan QR", style: TextStyle(fontSize: 17)),
  ),
);
