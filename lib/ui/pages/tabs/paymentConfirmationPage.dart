part of '../pages.dart';

class PaymentConfirmationPage extends StatefulWidget {
  final String bookingCode;
  const PaymentConfirmationPage({Key key, this.bookingCode}) : super(key: key);

  @override
  _PaymentConfirmationPageState createState() =>
      _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<PaymentConfirmationPage> {
  User _auth = FirebaseAuth.instance.currentUser;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  CollectionReference carCollection =
      FirebaseFirestore.instance.collection("Cars");

  String userID;
  String selectedCar;
  String brand, model, color, plateNumber;
  int balance;

  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      balance = event.data()['balance'];
      selectedCar = event.data()['selected car'];
      userID = _auth.uid;
      getSelectedCarData(selectedCar);
      setState(() {});
    });
  }

  void getSelectedCarData(carID) async {
    carCollection.doc(carID).snapshots().listen((event) {
      brand = event.data()['brand'];
      model = event.data()['model'];
      color = event.data()['color'];
      plateNumber = event.data()['plate number'];
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

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
                                    "#" + widget.bookingCode,
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
                        style: TextStyle(
                            color: Color(0xff8e8e93),
                            fontSize: 12,
                            decoration: TextDecoration.none))
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
                                NumberFormat.currency(
                                            locale: 'id', decimalDigits: 0)
                                        .format(balance) ??
                                    "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Change the color of the container beneath
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TopUpPage(),
                                  ));
                            });
                          },
                          child: Container(
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
                    Text("Car Information",
                        style: TextStyle(
                            color: Color(0xff8e8e93),
                            fontSize: 12,
                            decoration: TextDecoration.none))
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
                                    Text(plateNumber ?? "",
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
                                    Text(brand ?? "",
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
                                    Text(model ?? "",
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
                                    Text(
                                      "Color",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      color ?? "",
                                      style: TextStyle(
                                          color: Color(0xff8e8e93),
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Change the color of the container beneath
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ListCarPage(),
                                        ));
                                  });
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Change Car",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      Icon(CupertinoIcons.right_chevron,
                                          color: Color(0xff8e8e93))
                                    ],
                                  ),
                                ),
                              )
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
                    onPressed: () async {
                      if (balance < 30000) {
                        // BALANCE GAK CUKUP TOP UP WOI!
                        print("Duar ga cukup");
                      } else {
                        // HIYA CUKUP..

                        balance -= 30000;

                        await Firebase.initializeApp();

                        String msg = "";
                        try {
                          await PaymentServices.updateBooking(
                              widget.bookingCode,
                              userID,
                              timestamp,
                              selectedCar,
                              balance);
                          msg = "success";
                        } catch (e) {
                          msg = e.toString();
                        }
                        Navigator.pop(context);
                        return msg;
                      }
                    },
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
