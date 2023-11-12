import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/mainView.dart';
import 'package:lightner/methods/wordMeaning.dart';
import 'package:lightner/models/packageModel.dart';
import 'package:lightner/services/Providers/createProvider.dart';
import 'package:provider/provider.dart';
import '../../../../services/database.dart';
import '../../../../services/databaseService.dart';
import '../../../../static/colors.dart';
import 'make.dart';

class CreatePackage extends StatefulWidget {
  const CreatePackage({Key? key}) : super(key: key);

  @override
  State<CreatePackage> createState() => _CreatePackageState();
}

class _CreatePackageState extends State<CreatePackage> {

  var myController = ScrollController();

  String ?name;
  String ?bio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CreateProvider>(
          builder: (context, createProvider, snapshot) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        controller: myController,
                        child: Column(
                          children: [
                            Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ThemeColors.boxBorderColor, width: 2),
                                    color: ThemeColors.boxMainColor1
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Package Name",
                                    labelText: "Package Name",
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  border: Border.all(color: ThemeColors.boxBorderColor, width: 2),
                                  color: ThemeColors.boxMainColor1
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Package Description",
                                    labelText: "Package Description"
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    bio = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 50,),
                            SizedBox(height: 400, child: ListView.builder(itemCount: createProvider.words.length, itemBuilder: (BuildContext context, int index) => WordMeaning(index: index, myKey: ObjectKey("$index"),))),
                            // ...createProvider.wordMeaningBox,
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (name != null && name!.isNotEmpty) && (bio != null && bio!.isNotEmpty) ? () {
                                createProvider.addIndex();
                              } : null,
                              child: Container(
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: ThemeColors.boxBorderColor, width: 2),
                                    color: (name != null && name!.isNotEmpty) && (bio != null && bio!.isNotEmpty) ? ThemeColors.boxMainColor2 : ThemeColors.disabledColor
                                ),
                                child: Center(child: Text("Add Word", style: TextStyle(fontSize: 20),)),
                              ),
                            ),
                            SizedBox(height: 50,),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          createProvider.cancel();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainView()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: ThemeColors.boxBorderColor, width: 2,), top: BorderSide(color: ThemeColors.boxBorderColor, width: 2,), right: BorderSide(color: ThemeColors.boxBorderColor, width: 1,), left: BorderSide(color: ThemeColors.boxBorderColor, width: 2,)),
                              color: ThemeColors.boxMainColor0
                          ),
                          child: Center(child: Text("Cancel", style: TextStyle(fontSize: 20),)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          createProvider.done(name, bio);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainView()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: ThemeColors.boxBorderColor, width: 2,), top: BorderSide(color: ThemeColors.boxBorderColor, width: 2,), right: BorderSide(color: ThemeColors.boxBorderColor, width: 2,), left: BorderSide(color: ThemeColors.boxBorderColor, width: 1,)),
                              color: (name != null && name!.isNotEmpty) && (bio != null && bio!.isNotEmpty) ? ThemeColors.boxMainColor2 : ThemeColors.disabledColor
                          ),
                          child: Center(child: Text("Done", style: TextStyle(fontSize: 20),)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
