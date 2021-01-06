part of "services.dart";

class PaymentServices {
  static CollectionReference bookingCollection = FirebaseFirestore.instance.collection("Bookings");
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");

  static DocumentReference bookingDoc = bookingCollection.doc();
  static String bookingKey = bookingDoc.id;

  static Future<void> updateBooking(String bookingCode, userID, bookTimestamp, carID, afterBalance) async{
    print(bookingKey);
    bookingDoc.set(
      {
        'booking code' : bookingCode,
        'userID' : userID,
        'book timestamp' : bookTimestamp,
        'car back timestamp' : 0,
        'carID' : carID,
        'status' : "On Process",
      }
    );
    updateProfile(userID, bookingKey, afterBalance);
  } 

  static Future<void> updateProfile(String userID, bookingKey, afterBalance) async{
    userCollection.doc(userID).update(
      {
        'current booking' : bookingKey,
        'balance': afterBalance
      }
    );

  } 

}