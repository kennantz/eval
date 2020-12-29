part of '../pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Sign In', style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromRGBO(55, 94, 204, 1),
            )
          ];
        },
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                padding: const EdgeInsets.all(6),
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: CupertinoTextField(
                    decoration: new BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white)),
                    controller: ctrlEmail,
                    placeholder: "Email address"),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                padding: const EdgeInsets.all(6),
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: CupertinoTextField(
                    decoration: new BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white)),
                    controller: ctrlPassword,
                    placeholder: "Password"),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                // padding: const EdgeInsets.all(6),
                height: 50,
                width: 400,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(55, 94, 204, 1),
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: CupertinoButton(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 300, 10, 10),
                // padding: const EdgeInsets.all(6),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: RichText(
                      text: TextSpan(
                        text: "Haven't joined yet?",
                        style: TextStyle(color: Color.fromRGBO(161, 161, 161, 1)),
                        recognizer: TapGestureRecognizer()
                        ..onTap = (){
                          Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context){
                              return MyApp();
                            }));
                        }
                      ),
                    )
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ctrlPassword.dispose();
    ctrlEmail.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: Scaffold(
  //         appBar: AppBar(title: Text("Sign In")),

  //       ));
  // }
}
