import 'package:flutter/cupertino.dart';

class VenderProvider with ChangeNotifier {
  String venderId;
  String name;

  void AddVender(String Venderid, String Vendername) {
    venderId = Venderid;
    name = Vendername;
  }

  notifyListeners();
}
