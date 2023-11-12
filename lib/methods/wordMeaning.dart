import 'package:flutter/material.dart';
import 'package:lightner/services/Providers/createProvider.dart';
import 'package:provider/provider.dart';
import '../static/colors.dart';
import '../static/themeIcons.dart';

class WordMeaning extends StatefulWidget {

  final int index;
  final Key myKey;

  const WordMeaning({Key? key, required this.index, required this.myKey}) : super(key: key);

  @override
  State<WordMeaning> createState() => _WordMeaningState();
}

class _WordMeaningState extends State<WordMeaning> {

  String ?name;
  String ?meaning;

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateProvider>(
      builder: (context, createProvider, snapshot) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: ThemeColors.boxBorderColor, width: 2),
                      color: ThemeColors.boxMainColor1
                  ),
                  child: TextFormField(
                    key: widget.myKey,
                    decoration: InputDecoration(
                      labelText: "Question",
                      hintText: "Question",
                    ),
                    onChanged: (value) {
                      print("value $value \nindex ${widget.index}");
                      createProvider.changeWord(value, widget.index);
                    },
                  )
                ),
                SizedBox(width: 5,),
                IconButton(
                  icon: Icon(ThemeIcons.cross),
                  onPressed: () {
                    print('Cross Index: ${widget.index}');
                    createProvider.subIndex(widget.index);
                  },
                ),
                SizedBox(width: 5,),
                Container(
                  width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: ThemeColors.boxBorderColor, width: 2),
                        color: ThemeColors.boxMainColor1
                    ),
                    child: TextFormField(
                      key: widget.myKey,
                      decoration: InputDecoration(
                        labelText: "Answer",
                        hintText: "Answer",
                      ),
                      onChanged: (value) {
                        print("value $value \nindex ${widget.index}");
                        createProvider.changeMeaning(value, widget.index);
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 30,)
          ],
        );
      }
    );
  }
}
