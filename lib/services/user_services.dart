part of "services.dart";

class UserServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");
  static DocumentReference userDoc;

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
}

