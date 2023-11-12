import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrence {

  static SharedPreferences ?sharedPreferences;

  bool boarding = false;

  bool ?logIn;

  static Future<void> init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setBoarding(bool x) async{
    await sharedPreferences!.setBool('boarding', x);
  }

  static bool getBoarding(){
    return sharedPreferences!.getBool('boarding') ?? false;
    // return sharedPreferences!.getBool('boarding') != null ? sharedPreferences!.getBool('boarding') : false;
    // The two lines do the same thing
  }


}