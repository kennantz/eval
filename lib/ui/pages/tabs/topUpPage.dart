part of '../pages.dart';

class TopUpPage extends StatefulWidget {
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  void initState() {
    super.initState();
  }

  final ctrlNominal = TextEditingController();

  File imageFile;
  File defaultImage = File("eval/lib/assets/LogoText.png");

  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = File(selectedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text('Top Up'),
                )
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                      padding: const EdgeInsets.all(6),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: CupertinoTextField(
                        controller: ctrlNominal,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.white)),
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        placeholderStyle: TextStyle(color: Colors.grey[300]),
                        placeholder: "eg. Rp20.000",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                      padding: const EdgeInsets.all(6),
                      height: 200,
                      child: (imageFile != null)
                          ? Image.file(imageFile)
                          : Image.asset('lib/assets/LogoText.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                      // padding: const EdgeInsets.all(6),
                      height: 50,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(55, 94, 204, 1)),
                        color: Colors.white,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(8)),
                      ),
                      child: CupertinoButton(
                          onPressed: () async {
                            chooseImage();
                          },
                          child: Text(
                            'UPLOAD',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(55, 94, 204, 1)),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                      // padding: const EdgeInsets.all(6),
                      height: 50,
                      width: 400,
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(55, 94, 204, 1),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(8)),
                      ),
                      child: CupertinoButton(
                          onPressed: () async {
                            if (imageFile != null && ctrlNominal.text != "") {
                              await UserServices.sendPaymentImage(
                                      imageFile, int.parse(ctrlNominal.text))
                                  .then((value) {
                                if (value) {
                                  Fluttertoast.showToast(
                                    msg: "Top-up succesfull!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Navigator.pop(context);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Top-up failed, please try again",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Navigator.pop(context);
                                }
                              });
                            }
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }
}
