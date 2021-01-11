part of '../pages.dart';

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              // color: Colors.red,
              height: 400,
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
              margin: EdgeInsets.all(16),
              child: Text(
                "Your car will arrived soon. It will takes approx.\n5 minutes, please be ready at the lobby to avoid any delay for other users.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              height: 150,
            ),
          ],
        ),
      ),
    ));
  }
}
