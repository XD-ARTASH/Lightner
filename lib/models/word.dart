class Word {
  int ?kID;
  int pID;
  String word;
  String meaning;

  Word({required this.pID, required this.word, required this.meaning, this.kID});

  static fromJson(Map<String, dynamic> json) {
    return Word(kID: json['kID'], pID: json['pID'], word: json['word'], meaning: json['meaning'],);
  }

  Map<String, dynamic> toJson() {
    return {
      'kID' : kID,
      'pID' : pID,
      'word' : word,
      'meaning' : meaning,
    };
  }
}