import 'package:flutter/material.dart';
import 'package:lightner/services/database.dart';
import 'package:lightner/services/databaseService.dart';
import 'package:provider/provider.dart';
import '../../models/word.dart';
import '../../static/colors.dart';

class Info extends StatefulWidget {

  final int pID;
  final String name;

  const Info({Key? key, required this.pID, required this.name}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {

  List<Word> wordMeanings = [];
  String ?bio;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      wordMeanings = await DataBaseService(lightnerDataBase: LightnerDataBase.d_b).getWordsAndMeanings();
      bio = await DataBaseService(lightnerDataBase: LightnerDataBase.d_b).getBio(widget.pID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButton(),
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 30,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: ThemeColors.boxBorderColor),
                            color: ThemeColors.boxMainColor1
                        ),
                        child: Text(
                            widget.name
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        constraints: BoxConstraints(minHeight: 30),
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.boxBorderColor),
                          color: ThemeColors.boxMainColor1
                        ),
                        child: Text(
                          this.bio != null && this.bio!.isNotEmpty ? this.bio! : ''
                        ),
                      ),
                      SizedBox(height: 30,),
                      for (int ojoj = 0; ojoj < this.wordMeanings.length; ojoj++)
                        Row(
                          children: [
                            SizedBox(width: 65,),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ThemeColors.boxBorderColor),
                                  color: ThemeColors.boxMainColor1
                              ),
                              height: 50,
                              width: 130,
                              child: Text("${this.wordMeanings[ojoj].word}"),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ThemeColors.boxBorderColor),
                                  color: ThemeColors.boxMainColor1
                              ),
                              height: 50,
                              width: 130,
                              child: Text("${this.wordMeanings[ojoj].meaning}"),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
