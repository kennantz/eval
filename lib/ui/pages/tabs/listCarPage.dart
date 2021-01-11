part of '../pages.dart';

class ListCarPage extends StatefulWidget {
  @override
  _ListCarPageState createState() => _ListCarPageState();
}

class _ListCarPageState extends State<ListCarPage> {
  bool isLoading = false;

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("Cars");

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Car Brand"),
                    ),
                     TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Car Model"),
                    ),
                     TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Car Color"),
                    ),
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Plate Number (X XXXX XX)"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Confirm Correct"),
                        Checkbox(
                            value: isChecked,
                            onChanged: (checked) {
                              setState(() {
                                isChecked = checked;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                GestureDetector(
                  child: Text("Okay"),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
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
                child: Text("New", style: TextStyle(color: Colors.blue)),
              ),
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
                            return ListView(
                              children: snapshot1.data.docs
                                  .map((DocumentSnapshot doc) {
                                return CarCard(
                                  selectedCarID: snapshot.data.docs[0]
                                      .data()["selected car"],
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
