import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/home.dart';
import 'package:lightner/UI/Scaffolds/mainView.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {

  var DummyController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Align(
            child: Column(
              children: [
                PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                    length: 5,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.scale,
                    validator: (text) {
                      if (text!.length < 5) {
                        return 'You must enter a 5 digit OTP number';
                      }
                      else {
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 400),
                    enableActiveFill: true,
                    controller: DummyController4,
                    keyboardType: TextInputType.number,
                    separatorBuilder: (context, index) {
                      if ((index + 1) % 4 == 0) {
                        return const SizedBox(width: 10,);
                      }
                      return Container();
                    }
                ),
                FloatingActionButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainView())))
              ],
            ),
          )
        ),
      ),
    );
  }
}
