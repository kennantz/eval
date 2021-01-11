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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("My Cars"),
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
                                  selectedCarID: snapshot.data.docs[0].data()["selected car"],
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
