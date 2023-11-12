import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/mainView.dart';
import 'package:lightner/UI/Scaffolds/signUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var DummyController1 = TextEditingController();
  var DummyController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 400,
                  child: Column(
                    children: [
                      TextField(
                        controller: DummyController1,
                        decoration: InputDecoration(
                          hintText: "E-Mail"
                        ),
                      ),
                      TextField(
                        controller: DummyController2,
                        decoration: InputDecoration(
                            hintText: "Password"
                        ),
                      ),
                      Row(),
                      FloatingActionButton(heroTag: "augh1", onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainView()));
                      }),
                      FloatingActionButton(heroTag: "augh2", onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainView()));
                      }),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Don't have an account? "),
                    TextButton(onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));
                    },
                      child: Text("Sign up!", style: TextStyle(color: Colors.blueAccent),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
