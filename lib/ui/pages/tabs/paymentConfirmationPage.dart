part of '../pages.dart';

class PaymentConfirmationPage extends StatefulWidget {
  final String bookingCode;
  const PaymentConfirmationPage({Key key, this.bookingCode}) : super(key: key);

  @override
  _PaymentConfirmationPageState createState() =>
      _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<PaymentConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Payment"),
            )
          ];
        },
        body: Container(
          child: Column(
            children: [
              Container(
                height: 74,
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
                                    "Booking Code",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "#jlej41412414",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
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
              Container(
                padding: EdgeInsets.only(top: 22, left: 33),
                child: Row(
                  children: [
                    Text("TOTAL AMOUNT",
                        style:
                            TextStyle(color: Color(0xff8e8e93), fontSize: 12))
                  ],
                ),
              ),
              Container(
                height: 124,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Color(0xff2c2c2e),
                  margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 14, left: 4, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "30.000",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 14, left: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Method",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text("e-val wallet",
                                      style: TextStyle(
                                          color: Color(0xff8e8e93),
                                          fontSize: 16)),
                                  Icon(CupertinoIcons.right_chevron,
                                      color: Color(0xff8e8e93))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 22, left: 33),
                child: Row(
                  children: [
                    Text("Car Information",
                        style:
                            TextStyle(color: Color(0xff8e8e93), fontSize: 12))
                  ],
                ),
              ),
              Container(
                  height: 190,
                  width: double.infinity,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Color(0xff2c2c2e),
                      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Container(
                          padding:
                              EdgeInsets.only(top: 14, left: 18, right: 12),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 12, right: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Plate Number",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Text("",
                                        style: TextStyle(
                                            color: Color(0xff8e8e93),
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 12, right: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Brand",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Text("",
                                        style: TextStyle(
                                            color: Color(0xff8e8e93),
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 12, right: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("model",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Text("",
                                        style: TextStyle(
                                            color: Color(0xff8e8e93),
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 12, right: 6),
                                child: Row(
                                  children: [
                                    Text(
                                      "Color",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Color(0xff8e8e93),
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Change Car",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Icon(CupertinoIcons.right_chevron,
                                        color: Color(0xff8e8e93))
                                  ],
                                ),
                              ),
                            ],
                          )))),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                width: 400,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(55, 94, 204, 1),
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: CupertinoButton(
                    // onPressed: () async {
                    //   if (ctrlEmail.text == "" || ctrlPassword.text == "") {
                    //     Fluttertoast.showToast(
                    //       msg: "Please fill all fields!",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.BOTTOM,
                    //       backgroundColor: Colors.red,
                    //       textColor: Colors.white,
                    //       fontSize: 16,
                    //     );
                    //   } else {
                    //     String result = await AuthServices.signIn(
                    //         ctrlEmail.text, ctrlPassword.text);
                    //     if (result == "success") {
                    //       Fluttertoast.showToast(
                    //         msg: "DUOORRRRR MEMEX!",
                    //         toastLength: Toast.LENGTH_SHORT,
                    //         gravity: ToastGravity.BOTTOM,
                    //         backgroundColor: Colors.green,
                    //         textColor: Colors.white,
                    //         fontSize: 16,
                    //       );
                    //       Navigator.pushReplacement(context,
                    //           MaterialPageRoute(builder: (context) {
                    //         return MainMenu();
                    //       }));
                    //     } else {
                    //       Fluttertoast.showToast(
                    //         msg: result,
                    //         toastLength: Toast.LENGTH_SHORT,
                    //         gravity: ToastGravity.BOTTOM,
                    //         backgroundColor: Colors.green,
                    //         textColor: Colors.white,
                    //         fontSize: 16,
                    //       );
                    //     }
                    //   }
                    // },
                    child: Text(
                  'Order',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
