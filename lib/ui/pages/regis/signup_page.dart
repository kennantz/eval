part of '../pages.dart';

class SignUpPages extends StatefulWidget {
  @override
  _SignUpPagesState createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlConfPass = TextEditingController();
  final ctrlPhone = TextEditingController();

  @override
  void dispose() {
    ctrlPassword.dispose();
    ctrlEmail.dispose();
    ctrlName.dispose();
    ctrlConfPass.dispose();
    ctrlPhone.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Sign Up', style: TextStyle(color: Colors.white)),
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
                    controller: ctrlName,
                    placeholder: "Full Name"),
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
                    controller: ctrlPhone,
                    placeholder: "Phone number"),
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
                padding: const EdgeInsets.all(6),
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: CupertinoTextField(
                    decoration: new BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white)),
                    controller: ctrlConfPass,
                    placeholder: "Confirm password"),
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
                        onPressed: () async{
                          if (ctrlName.text == "" ||
                              ctrlEmail.text == "" ||
                              ctrlPassword.text == "" ||
                              ctrlConfPass.text == "" ||
                              ctrlPhone.text == "" ) {
                            Fluttertoast.showToast(
                              msg: "Please fill all fields!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else {
                            if (ctrlPassword.text == ctrlConfPass.text) 
                            {
                            String result = await AuthServices.signUp(ctrlEmail.text, ctrlPassword.text, ctrlName.text, ctrlPhone.text);
                            if(result=='success'){
                              Fluttertoast.showToast(
                                msg: "DUAR MEMEK!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                            }else{
                               Fluttertoast.showToast(
                                msg: result,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16,
                              );
                            }
                            } else {
                              Fluttertoast.showToast(
                              msg: "Password do not match!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                              );
                            }
                          }
                        },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                // padding: const EdgeInsets.all(6),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(8)),
                ),
                child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By signing up, you confirm that you agree to \nour Terms of Use and have read and \nunderstood our Privacy Policy",
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
  }
