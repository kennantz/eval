part of '../pages.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  String result;

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();

      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      timestamp.substring(timestamp.length - 5);

      result = qrResult + timestamp;
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PaymentConfirmationPage(bookingCode: result)),
        );
      });
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
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Eval'),
            )
          ];
        },
        body: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _scanQR();
                },
                child: Container(
                  height: 280,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Colors.blue,
                    margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Container(
                      padding: EdgeInsets.only(top: 14, left: 18, right: 12),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "BOOKING",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Get Your Car Parked",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("tapped on container");
                },
                child: Container(
                  height: 280,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Color(0xff2c2c2e),
                    margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Container(
                      padding: EdgeInsets.only(top: 14, left: 18, right: 12),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "REQUEST",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Get Your Car Ready\nIn Loby",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
