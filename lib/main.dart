import 'package:flutter/material.dart';
import 'package:lightner/services/Providers/mainViewProvider.dart';
import 'package:lightner/services/database.dart';
import 'package:lightner/services/sharedPrefrence.dart';
import 'package:lightner/services/Providers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:lightner/UI/Scaffolds/splashScreen.dart';
import 'package:lightner/services/Providers/createProvider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrence.init();
  runApp(
      MultiProvider(providers: [
        ListenableProvider.value(value: StateProvider(dataBase: LightnerDataBase.d_b)),
        ListenableProvider.value(value: MainViewProvider()),
        ListenableProvider.value(value: CreateProvider(dataBase: LightnerDataBase.d_b)),
      ], child: MaterialApp(home: SplashScreen()))
  );

}