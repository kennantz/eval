part of '../pages.dart';

class PaymentConfirmationPage extends StatefulWidget {

  final String bookingCode;
  const PaymentConfirmationPage ({ Key key, this.bookingCode }): super(key: key);

  @override
  _PaymentConfirmationPageState createState() => _PaymentConfirmationPageState();
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
          
        ),
      ),
    );
  }

}