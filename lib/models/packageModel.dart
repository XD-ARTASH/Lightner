class PackageModel {
  int ?kID;
  String name;
  String bio;
  int pID;
  int use;

  PackageModel({required this.name, required this.bio, required this.pID, required this.use, this.kID});

  static PackageModel fromJson(Map<String, dynamic> json) {
    return PackageModel(kID: json['kID'], name: json['name'], bio: json['bio'], pID: json['pID'], use: json['use']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bio': bio,
      'pID': pID,
      'use': use
    };
  }

}