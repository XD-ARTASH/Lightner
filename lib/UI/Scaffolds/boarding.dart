import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lightner/UI/Scaffolds/logIn.dart';
import 'package:lightner/services/sharedPrefrence.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OnBoardingSlider(
          totalPage: 2,
          speed: 2,
          background: [Icon(Icons.add), Text('🥷🏾')],
          pageBodies: [Icon(Icons.add), Text('🥷🏾')],
          centerBackground: true,
          headerBackgroundColor: Colors.white,
          onFinish: () {
            print("Finish");
            SharedPrefrence.setBoarding(true);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LogIn()));
          },
        ),
      ),
    );
  }
}
