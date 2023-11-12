import 'package:flutter/material.dart';
import 'package:lightner/services/Providers/stateProvider.dart';
import 'package:provider/provider.dart';
import '../UI/Scaffolds/info.dart';
import '../static/colors.dart';
import '../static/themeIcons.dart';

class PackageBox extends StatefulWidget {

  final int state;
  final String name;
  final int pID;

  const PackageBox({Key? key, required this.state, required this.name, required this.pID}) : super(key: key);

  @override
  State<PackageBox> createState() => _PackageBoxState();
}

class _PackageBoxState extends State<PackageBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.packageBorderColor),
            color: widget.state == 0 ? ThemeColors.packageMainColor0 : widget.state == 1 ? ThemeColors.packageMainColor1 : ThemeColors.packageMainColor2
          ),
          child: Row(
            children: [
              Expanded(
                flex: 18,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ThemeColors.packageBorderColor),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: Row(
                            children: [
                              Text(widget.name, style: TextStyle(fontSize: 18),),
                              Text("${widget.pID}", style: TextStyle(fontSize: 18),),
                            ],
                          )),
                          width: 265,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: ThemeColors.packageBorderColor, ))
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: ThemeColors.packageBorderColor, ))
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Center(child: Text("# of items"))),
                              Expanded(
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Start"),
                                  ),
                                ),
                              ),
                              Expanded(child: Center(child: Text("# of days")))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ThemeColors.packageBorderColor),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: ThemeColors.packageBorderColor, ))
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Info(pID: widget.pID, name: widget.name,)));
                              },
                              icon: Icon(ThemeIcons.info),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.symmetric(horizontal: BorderSide(color: ThemeColors.packageBorderColor, ))
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(ThemeIcons.edit),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: ThemeColors.packageBorderColor, ))
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Provider.of<StateProvider>(context, listen: false).delPackage(widget.pID);
                                print('del pressed');
                              },
                              icon: Icon(ThemeIcons.delete),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
