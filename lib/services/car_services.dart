part of "services.dart";

class CarServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");
  static CollectionReference carCollection = FirebaseFirestore.instance.collection("Cars");
  
  static DocumentReference userDoc;

  static DocumentReference carDoc = carCollection.doc();
  static String carKey = carDoc.id;

  static Future<void> updateSelectedCar(String carID) async{

    String userID = FirebaseAuth.instance.currentUser.uid;
    userCollection.doc(userID).update(
      {
        'selected car' : carID,
      }
    );

  } 

  static Future<void> addNewCar(String carBrand, carModel, carColor, plateNumber) async{
    carDoc.set(
      {
        'id' : carKey,
        'brand' : carBrand,
        'model' : carModel,
        'color' : carColor,
        'plate number' : plateNumber,
      }
    );

    updateUserCar(carBrand, carModel, carColor, plateNumber);

  } 

  static Future<void> updateUserCar(String carBrand, carModel, carColor, plateNumber) async{
    String userID = FirebaseAuth.instance.currentUser.uid;
    userCollection.doc(userID).collection("Cars").doc(carKey).set(
      {
        'id' : carKey,
        'brand' : carBrand,
        'model' : carModel,
        'color' : carColor,
        'plate number' : plateNumber,
      }
    );
  }

}