part of '../pages.dart';

class TopUpPage extends StatefulWidget {
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  void initState() {
    super.initState();
  }

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
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Top Up'),
          )
        ];
      },
      body: Container(
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
                decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.white)),
                style: TextStyle(color: Colors.black),
                placeholderStyle: TextStyle(color: Colors.grey[300]),
                placeholder: "Top Up",
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
              padding: const EdgeInsets.all(6),
              height: 380,
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
                border: Border.all(color: const Color.fromRGBO(55, 94, 204, 1)),
                color: Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(8)),
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
                borderRadius: new BorderRadius.all(new Radius.circular(8)),
              ),
              child: CupertinoButton(
                  // onPressed: () async {
                  //   if (ctrlEmail.text == "" || ctrlPassword.text == "") {
                  //     Fluttertoast.showToast(
                  //       msg: "Please fill all fields!",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.BOTTOM,
                  //       backgroundColor: Colors.red,
                  //       textColor: Colors.white,
                  //       fontSize: 16,
                  //     );
                  //   } else {
                  //     String result = await AuthServices.signIn(
                  //         ctrlEmail.text, ctrlPassword.text);
                  //     if (result == "success") {
                  //       Fluttertoast.showToast(
                  //         msg: "DUOORRRRR MEMEX!",
                  //         toastLength: Toast.LENGTH_SHORT,
                  //         gravity: ToastGravity.BOTTOM,
                  //         backgroundColor: Colors.green,
                  //         textColor: Colors.white,
                  //         fontSize: 16,
                  //       );
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder: (context) {
                  //         return MainMenu();
                  //       }));
                  //     } else {
                  //       Fluttertoast.showToast(
                  //         msg: result,
                  //         toastLength: Toast.LENGTH_SHORT,
                  //         gravity: ToastGravity.BOTTOM,
                  //         backgroundColor: Colors.green,
                  //         textColor: Colors.white,
                  //         fontSize: 16,
                  //       );
                  //     }
                  //   }
                  // },
                  child: Text(
                'SUBMIT',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    ));
  }
}
