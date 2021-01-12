part of "services.dart";

class UserServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");
  static CollectionReference topUpCollection = FirebaseFirestore.instance.collection("Top-Up");
  static DocumentReference userDoc;

  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;

  static Future<void> updateUser(Users users) async{
    userCollection.doc(users.uid).set(
      {
        'uid' : users.uid,
        'email' : users.email,
        'name' : users.name,
        'phone' : users.phone,
        'balance' : 0,
        'selected car' : "",
        'number of cars' : 0,
        'current booking' : "",
      }
    );
  } 

  static Future sendPaymentImage(File imageFile, int nominal) async {

    String userID = FirebaseAuth.instance.currentUser.uid;
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String fileName = userID + "_" + timestamp + ".png";

    ref = FirebaseStorage.instance
        .ref()
        .child('paymentImages')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return topUpCollection
        .doc()
        .set({
          'user ID': userID,
          'nominal': nominal,
          'payment image url': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }

}

