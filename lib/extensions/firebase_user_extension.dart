part of 'extensions.dart';

extension FirebaseUserExtension on User{

  Users convertToUser({String name = "No Name", String phone = ""}) => Users(this.uid, this.email, name: name, phone: phone);

}