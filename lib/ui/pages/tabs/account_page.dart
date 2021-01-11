part of '../pages.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User _auth = FirebaseAuth.instance.currentUser;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  String img, name, email, phoneNumber, selectedCar;
  int balance;

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      name = event.data()['name'];
      email = event.data()['email'];
      phoneNumber = event.data()['phone'];
      balance = event.data()['balance'];
      selectedCar = event.data()['selected car'];

      if (selectedCar == "") {
        selectedCar = "None";
      } else {
        selectedCar = "Model";
      }

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
                largeTitle: Text('Account'),
              )
            ];
          },
          body: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 22, left: 33),
                  child: Row(
                    children: [
                      Text("PERSONAL INFORMATION",
                          style: TextStyle(
                              color: Color(0xff8e8e93),
                              fontSize: 12,
                              decoration: TextDecoration.none))
                    ],
                  ),
                ),
                Container(
                    height: 152,
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
                                  padding:
                                      EdgeInsets.only(bottom: 12, right: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Name",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      Text(name ?? "",
                                          style: TextStyle(
                                              color: Color(0xff8e8e93),
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 12, right: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Email",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      Text(email ?? "",
                                          style: TextStyle(
                                              color: Color(0xff8e8e93),
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(bottom: 12, right: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Phone Number",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      Text(phoneNumber ?? "",
                                          style: TextStyle(
                                              color: Color(0xff8e8e93),
                                              fontSize: 16)),
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
                                        Text("Current Car",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                        Row(
                                          children: [
                                            Text(selectedCar ?? "",
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
                            )))),
                Container(
                  padding: EdgeInsets.only(top: 22, left: 33),
                  child: Row(
                    children: [
                      Text("E-VAL WALLET",
                          style: TextStyle(
                              color: Color(0xff8e8e93),
                              fontSize: 12,
                              decoration: TextDecoration.none))
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
                                      padding: EdgeInsets.only(
                                          top: 14, left: 4, right: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              NumberFormat.currency(
                                                          locale: 'id',
                                                          decimalDigits: 0)
                                                      .format(balance) ??
                                                  "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )),
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 14, left: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Top-up",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              )),
                                          Icon(CupertinoIcons.right_chevron,
                                              color: Color(0xff8e8e93))
                                        ],
                                      ))
                                ],
                              )))),
                ),
                GestureDetector(
                    onTap: () async {
                      await AuthServices.signOut().then((value) {
                        if (value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SignInPage();
                          }));
                        } else {}
                      });
                    },
                    child: Container(
                        height: 74,
                        width: double.infinity,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: Color(0xff2c2c2e),
                            margin:
                                EdgeInsets.only(top: 22, left: 16, right: 16),
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 12, left: 12, right: 12),
                                child: Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Log out",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                )),
                                            Icon(CupertinoIcons.right_chevron,
                                                color: Color(0xff8e8e93))
                                          ],
                                        ))
                                  ],
                                )))))
              ],
            ),
          )),
    );
  }
}
