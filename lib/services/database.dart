import 'package:lightner/methods/packageBox.dart';
import 'package:lightner/models/packageModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/word.dart';

class LightnerDataBase {

  LightnerDataBase._();

  static final LightnerDataBase d_b = LightnerDataBase._();

  Database? _database;

  Future<Database> initTables() async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentDirectory.path , 'Lightner.db');
    return await openDatabase(path, version: 1, onOpen: (db) => print('augh: ${db.isOpen} ${db.path}'), onCreate: (db,version) => _onCreateTable(db));
  }

  static void _onCreateTable(Database db) {
    print('on create: table - ${db.path} - ${db.isOpen}');
    db.execute(
      'CREATE TABLE Packages ('
          'kID INTEGER PRIMARY KEY,'
          'name TEXT,'
          'bio TEXT,'
          'pID INTEGER,'
          'use INTEGER'
          ')'
    );
    db.execute(
      'CREATE TABLE Word ('
          'kID INTEGER PRIMARY KEY,'
          'word TEXT,'
          'meaning TEXT,'
          'pID INTEGER'
          ')'
    );
  }

  Future<Database> database() async {
    if (_database == null) print('dataBase is null');
    if (_database != null) return _database!;
    _database = await initTables();
    return _database!;
  }

  Future<int> insertPackage(PackageModel newPackage) async {
    final db = await database();

    /// getting the biggest id in the table
    var table = await db.rawQuery('SELECT MAX(kID)+1 as kID FROM Packages');
    var id = table.first['kID'];

    /// inserting to the table using the new id
    var insert = await db.insert(
        'Packages',
        {
          'kID': id,
          'name': newPackage.name,
          'bio': newPackage.bio,
          'pID': newPackage.pID,
          'use': newPackage.use,
        });
    return insert;
  }

  Future<int> insertWord(Word newWord) async {
    final db = await database();

    /// getting the biggest id in the table
    var table = await db.rawQuery('SELECT MAX(kID)+1 as kID FROM Word');
    var id = table.first['kID'];

    /// inserting to the table using the new id
    var insert = await db.insert(
        'Word',
        {
          'kID': id,
          'word': newWord.word,
          'meaning': newWord.meaning,
          'pID': newWord.pID,
        });
    return insert;
  }

  ///  Delete
  Future<int> deletePackage(int x) async {
  final db = await database();
  return db.delete('Packages',
      where: 'pID = ?', whereArgs: <dynamic>[x]);
  }

  Future<int> deleteWord(Word newWord) async {
    final db = await database();
    return db.delete('Word',
        where: 'kID = ?', whereArgs: <dynamic>[newWord.kID]);
  }

  ///  Update
  Future<int> updatePackage(PackageModel newPackage) async {
    final db = await database();
    var res = await db.update('Packages', newPackage.toJson(),
        where: 'kID = ?', whereArgs: <dynamic>[newPackage.kID]);
    return res;
  }

  Future<int> updateWord(Word newWord) async {
    final db = await database();
    var res = await db.update('Word', newWord.toJson(),
        where: 'kID = ?', whereArgs: <dynamic>[newWord.kID]);
    return res;
  }

  /// *** Queries of Packages
  Future<PackageModel?> findPackageByPId(int id) async {
    final db = await database();
    var res = await db.query('Packages', where: 'pID = ?', whereArgs: <dynamic>[id]);
    return res.isNotEmpty ? PackageModel.fromJson(res.first) : null;
  }

  Future<int?> getPackageKIdByPid(int id) async {
    final db = await database();
    print('db: ${db.database.isOpen}');
    var res = await db.query('Packages', where: 'pID = ?', whereArgs: <dynamic>[id]);
    print("resource length: ${res.length}");
    print("resource id: ${id}");
    print("resource kid: ${res.first}");
    return res.isNotEmpty ? PackageModel.fromJson(res.first).kID : null;
  }

  Future <List<PackageModel>> getPackages() async {
    final db = await database();
    var res = await db.query('Packages');
    List <PackageModel> temp = [];
    for (int j = 0; j < res.length.toInt(); j++) {
      print('$j - ${res[j]}');
      temp.add(PackageModel.fromJson(res[j]));
    }
    return temp;
  }

  Future <List <Word>> getWordsAndMeanings() async {
    final db = await database();
    var res = await db.query('Word');
    List <Word> temp = [];
    for (int j = 0; j < res.length.toInt(); j++) {
      temp.add(Word.fromJson(res[j]));
    }
    return temp;
  }

}