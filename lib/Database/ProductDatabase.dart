import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDatabase {
  Future UpdateStatus(String uid) async {
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(uid)
        .update({"status": "Processing"});
  }

  Future UpdateStatus2(String uid) async {
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(uid)
        .update({"status": "Confirmed"});
  }

  Future CreateProduct(String area, time, description, foodtype, image,
      productname, price, venderid, vendername, int phone) async {
    return await FirebaseFirestore.instance.collection('ExploreCards').add({
      "Area of Delivery": area,
      "deliveryTime": time,
      "description": description,
      "foodtype": foodtype,
      "image": image,
      "name": productname,
      "price": price,
      "vendorId": venderid,
      "vendorName": vendername,
      "rating": " 5 (5)",
      "Date": DateTime.now(),
      "VenderNumber" : phone,
      "productId": ''
    }).then((value) {
      print(value.id);
      FirebaseFirestore.instance
          .collection('ExploreCards')
          .doc(value.id)
          .update({"productId": value.id});
    });
  }
}
