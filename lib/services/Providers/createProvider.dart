import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lightner/methods/wordMeaning.dart';
import 'package:lightner/models/packageModel.dart';
import 'package:lightner/services/database.dart';
import 'package:lightner/services/sharedPrefrence.dart';
import '../../models/word.dart';
import '../databaseService.dart';

class CreateProvider extends ChangeNotifier {

  final LightnerDataBase dataBase;

  CreateProvider({required this.dataBase});

  List<String> words = [];
  List<String> meanings = [];

  void addIndex() {
    this.words.add("");
    this.meanings.add("");
    // this.wordMeaningBox.add(WordMeaning(index: this.words.length - 1, myKey: ObjectKey('${words.length}'),));
    notifyListeners();
  }

  void subIndex(int index) {
    this.words.removeAt(index);
    this.meanings.removeAt(index);
    notifyListeners();
  }

  void cancel() {
    this.words.clear();
    this.meanings.clear();
    notifyListeners();
  }

  void changeMeaning(String value, int index) {
    meanings[index] = value;
    notifyListeners();
  }

  void changeWord(String value, int index) {
    print("changeword:\n   Index: $index\n   Length: ${this.words.length}");
    words[index] = value;
    notifyListeners();
  }

  //TODO: Impliment this function
  void done(String? name, String? bio) {

  }
  
}