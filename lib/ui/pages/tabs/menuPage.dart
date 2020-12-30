part of '../pages.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
              Container(
                height: 300,
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
                                        color: Colors.black, fontSize: 25),
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
                height: 300,
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
                                  Text(
                                    "Get Your Car Ready In Loby",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
