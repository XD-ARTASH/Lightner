import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/confirm.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var DummyController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Align(
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "E-Mail"
                    ),
                    controller: DummyController3,
                  ),
                ),
                FloatingActionButton(onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Confirm()))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
