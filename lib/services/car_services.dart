part of "services.dart";

class CarServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");
  static DocumentReference userDoc;

  static Future<void> updateSelectedCar(String carID) async{
    String userID = FirebaseAuth.instance.currentUser.uid;
    userCollection.doc(userID).update(
      {
        'selected car' : carID,
      }
    );
  } 
}