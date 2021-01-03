part of '../pages.dart';

class ListCarPage extends StatefulWidget {
  @override
  _ListCarPageState createState() => _ListCarPageState();
}

class _ListCarPageState extends State<ListCarPage> {
  bool isLoading = false;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("Cars");

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
                stream: productCollection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    children: snapshot.data.docs.map((DocumentSnapshot doc) {
                      return CarCard(
                        car: Cars(doc.data()['id'], doc.data()['brand'], doc.data()['model'], doc.data()['color'], doc.data()['plate number'], doc.data()['isSelected']),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
