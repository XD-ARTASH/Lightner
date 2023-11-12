import 'package:flutter/material.dart';
import 'package:lightner/methods/packageBox.dart';
import 'package:lightner/services/database.dart';
import 'package:lightner/services/databaseService.dart';

class StateProvider extends ChangeNotifier {

  final LightnerDataBase dataBase;

  StateProvider({required this.dataBase});

  List<PackageBox> _packageBox = [];

  void delPackage(int y) async {
    print("ID in StateProVider: ${await dataBase.getPackageKIdByPid(y)}");
    int ?index = await dataBase.getPackageKIdByPid(y);
    _packageBox.removeAt(index! - 1);
    DataBaseService(lightnerDataBase: LightnerDataBase.d_b).delPackage(y);
    notifyListeners();
  }

  void setPackageBox(List<PackageBox> xs) {
    _packageBox = xs;
    notifyListeners();
  }

  List<PackageBox> get packageBox => _packageBox;

}

