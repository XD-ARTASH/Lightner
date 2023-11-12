import 'package:flutter/material.dart';
import 'package:lightner/methods/packageBox.dart';
import 'package:lightner/services/database.dart';
import 'package:lightner/services/databaseService.dart';
import 'package:provider/provider.dart';

import '../../../services/Providers/stateProvider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DataBaseService(lightnerDataBase: LightnerDataBase.d_b).getPackageBoxes(Provider.of(context, listen: false));
    });
    print('home');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, stateProvider, snapshot) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(height: 80,),
              Center(child: Text("My Packages", style: TextStyle(fontSize: 30),)),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: stateProvider.packageBox
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
