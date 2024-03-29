import 'GeneratedQR.dart';
import 'package:flutter/material.dart';
import 'package:encryption/AESEncryption/AES.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({Key? key}) : super(key: key);

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

TextEditingController mycontroller = TextEditingController();

class _QRGeneratorState extends State<QRGenerator> {
  AESEncryption encryption = AESEncryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR here"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Encrypt.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            buildTextFormField(),
            SizedBox(height: 20),
            buildGenerateQRBtn(),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField() => Padding(
    padding: const EdgeInsets.all(15),
    child: TextFormField(
      controller: mycontroller,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15.0),
        labelText: "Enter message you want to Encrypt",
        labelStyle: TextStyle(
          color: Colors.white70,
          fontSize: 20.0,
        ),
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 16.0,
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.white70,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
      ),
      onEditingComplete: navigate,
    ),
  );

  Widget buildGenerateQRBtn() => ElevatedButton(
    child: Text(
      "Generate QR",
      style: TextStyle(fontSize: 17),
    ),
    onPressed: navigate,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  void navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GeneratedQR(encryption.encryptMsg(mycontroller.text).base16)));
  }
}
