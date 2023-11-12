import 'package:lightner/models/packageModel.dart';
import 'package:lightner/services/Providers/stateProvider.dart';
import '../methods/packageBox.dart';
import '../models/word.dart';
import 'database.dart';

class DataBaseService {

  final LightnerDataBase lightnerDataBase;

  DataBaseService({required this.lightnerDataBase});

  Future<void> getPackageBoxes(StateProvider stateProvider) async {
    var temp = await lightnerDataBase.getPackages();
    List<PackageBox> temp2 = [];
    for (int ojo = 0; ojo < temp.length; ojo++) {
      temp2.add(PackageBox(state: temp[ojo].use, name: temp[ojo].name, pID: temp[ojo].pID));
    }
    stateProvider.setPackageBox(temp2);
  }

  Future<void> addWords(List<Word> x, int y) async {
    for(int ojo = 0; ojo < y; ojo++) {
      await lightnerDataBase.insertWord(x[ojo]);
    }
  }

  Future<void> addPackage(PackageModel x) async {
    await lightnerDataBase.insertPackage(x);
  }

  Future<void> delPackage(int x) async {
    await lightnerDataBase.deletePackage(x);
  }

  Future<List<int>> getPId() async {
    List<PackageModel> temp = await lightnerDataBase.getPackages();
    List<int> reTemp = [];
    temp.forEach((tempElement) => reTemp.add(tempElement.pID));
    return reTemp;
  }

  Future<String> getBio(int x) async {
    var temp = await lightnerDataBase.findPackageByPId(x);
    return temp!.bio;
  }

  Future<List<Word>> getWordsAndMeanings() async {
    return lightnerDataBase.getWordsAndMeanings();
  }

}