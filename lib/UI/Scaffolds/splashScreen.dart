import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/boarding.dart';
import 'package:lightner/UI/Scaffolds/logIn.dart';
import 'package:lightner/services/sharedPrefrence.dart';
import '../../models/deBouncer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static final DeBouncer sleep = DeBouncer(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    sleep.run(() {
      SharedPrefrence.getBoarding() ?
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LogIn()))
      : Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Boarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(flex: 15, child: Image.asset('assets/images/logo.png', width: 300, height: 300,)),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("By ARTASH", style: TextStyle(fontSize: 25),),
                      Text("V1.0.0",  style: TextStyle(fontSize: 12))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
