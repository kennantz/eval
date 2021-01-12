part of '../pages.dart';

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  String userID = FirebaseAuth.instance.currentUser.uid;
  int counter = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text('Request Car'),
              )
            ];
          },
          body: Container(
              color: Color.fromRGBO(55, 94, 204, 1),
              height: 100,
              child: StreamBuilder<QuerySnapshot>(
                  stream: userCollection.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    for (var i = 0; i < snapshot.data.docs.length; i++) {
                      String userIDThatChange =
                          snapshot.data.docs[i].data()["uid"];

                      if (userID == userIDThatChange &&
                          snapshot.data.docs[i].data()["current booking"] ==
                              "") {
                        Fluttertoast.showToast(
                          msg:
                              "Your car is ready! Thankyou for using our service :)",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pop(context);
                        break;
                      }
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // color: Colors.red,
                          height: 300,
                          width: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/LogoText.png'),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        Container(
                          child: Text(
                            "On the Way.",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.all(14),
                          child: Text(
                            "Your car will arrived soon. It will takes approx.\n5 minutes, please be ready at the lobby to avoid any delay for other users.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          height: 150,
                        ),
                      ],
                    );
                  })),
        ));
  }
}
