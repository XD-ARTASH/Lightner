import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/make/create.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/make/upload.dart';

import '../../../../static/colors.dart';

class Make extends StatefulWidget {
  const Make({Key? key}) : super(key: key);

  @override
  State<Make> createState() => _MakeState();
}

class _MakeState extends State<Make> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CreatePackage()));
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.packageBorderColor, width: 2),
                          color: ThemeColors.boxMainColor1
                      ),
                      child: Center(child: Text("Create a package!", style: TextStyle(fontSize: 30),))
                    ),
                  ),
                  SizedBox(height: 50,),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Upload()));
                  //   },
                  //   child: Container(
                  //     width: 300,
                  //     height: 100,
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: ThemeColors.packageBorderColor, width: 2),
                  //         color: ThemeColors.boxMainColor
                  //     ),
                  //     child: Center(child: Text("Upload a package!", style: TextStyle(fontSize: 30),)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
