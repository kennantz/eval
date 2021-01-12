part of '../pages.dart';

class ListCarPage extends StatefulWidget {
  @override
  _ListCarPageState createState() => _ListCarPageState();
}

class _ListCarPageState extends State<ListCarPage> {

  String userID = FirebaseAuth.instance.currentUser.uid;
  String carThatChange;

  bool isLoading = false;

  CollectionReference productCollection = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("Cars");

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textCarBrandController =
              TextEditingController();
          final TextEditingController _textCarModelController =
              TextEditingController();
          final TextEditingController _textCarColorController =
              TextEditingController();
          final TextEditingController _textCarPlateNumberController =
              TextEditingController();
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.all(8),
                    //   child: Text("Add new Car",
                    //       style: TextStyle(fontWeight: FontWeight.bold)),
                    // ),
                    TextFormField(
                      controller: _textCarBrandController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Car Brand"),
                    ),
                    TextFormField(
                      controller: _textCarModelController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Car Model"),
                    ),
                    TextFormField(
                      controller: _textCarColorController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Car Color"),
                    ),
                    TextFormField(
                      controller: _textCarPlateNumberController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration:
                          InputDecoration(hintText: "Plate Number (X XXXX XX)"),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                GestureDetector(
                  child: CupertinoButton(
                      child: Text("Add", style: TextStyle(color: Colors.blue))),
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      String carBrand = _textCarBrandController.text;
                      String carModel = _textCarModelController.text;
                      String carColor = _textCarColorController.text;
                      String plateNumber = _textCarPlateNumberController.text;

                      await CarServices.addNewCar(
                          carBrand, carModel, carColor, plateNumber);

                      Navigator.of(context).pop();

                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("My Cars"),
              trailing: GestureDetector(
                  onTap: () async {
                    await showInformationDialog(context);
                    print("tapped");
                  },
                  child: Icon(Icons.add)),
            )
          ];
        },
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                child: StreamBuilder<QuerySnapshot>(
                    stream: userCollection.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: productCollection.snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot1) {
                            if (snapshot.hasError) {
                              return Text("Failed to get products data!");
                            }
                            // if (snapshot.connectionState == ConnectionState.waiting) {
                            //   return SpinKitFadingCircle(
                            //     size: 50,
                            //     color: Colors.blue,
                            //   );
                            // }
                            
                            for (var i = 0; i < snapshot.data.docs.length; i++) {
                              String userIDThatChange = snapshot.data.docs[i].data()["uid"];
                              if (userID == userIDThatChange) {
                                carThatChange = snapshot.data.docs[i].data()["selected car"];
                                break;
                              }
                            }

                            return ListView(
                              children: snapshot1.data.docs
                                  .map((DocumentSnapshot doc) {
                                return CarCard(
                                  selectedCarID: carThatChange,
                                  car: Cars(
                                      doc.data()['id'],
                                      doc.data()['brand'],
                                      doc.data()['model'],
                                      doc.data()['color'],
                                      doc.data()['plate number'],
                                      doc.data()['isSelected']),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
