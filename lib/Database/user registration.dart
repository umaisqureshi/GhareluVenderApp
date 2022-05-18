import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  final CollectionReference userDatabase =
      FirebaseFirestore.instance.collection('Vender_Detail');

  Future CreateUserData(String name, String phone, String address, String cnic,
      String paddress, String days, String time, String menuImage) async {
    return await userDatabase.doc(uid).set({
      'name': name,
      'phone': phone,
      'address': address,
      'Uid': uid,
      'CNIC': cnic,
      "Area of Delivery": paddress,
      "Opening Days": days,
      "Timing": time,
      "Image": menuImage
    });
  }
}
