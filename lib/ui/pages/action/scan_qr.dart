part of '../pages.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRCode createState() => new _ScanQRCode();
}

class _ScanQRCode extends State<ScanQR> {
  String result = "";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
        qrResult = result;
    } on PlatformException catch (error) {
      if (error.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera Access Denied";
        });
      } else {
        setState(() {
          result = "Error unknown $error";
        });
      }
    } on FormatException {
      setState(() {
        result = "You canceled scanning";
      });
    } catch (error) {
      result = "Error unknown $error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Scan'),
                onPressed: () async {
                  var scanQR = _scanQR;
                },
              ),
              Text(
                'Result: $result',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
