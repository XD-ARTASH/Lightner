import 'package:flutter/material.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/home.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/search.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/settings.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/social.dart';
import 'package:lightner/UI/Scaffolds/BottomNavigationPages/make/make.dart';
import 'package:lightner/UI/Widgets/bottomNavigationItem.dart';
import 'package:lightner/main.dart';
import 'package:lightner/services/Providers/mainViewProvider.dart';
import 'package:lightner/static/themeIcons.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<MainViewProvider>(
          builder: (context, mainViewProvider ,snapshot) {
            return fragment(mainViewProvider.getPage());
          }
        ),
      ),
      bottomNavigationBar: Consumer<MainViewProvider>(
        builder: (context, mainViewProvider,snapshot) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xffd9d9d9),
            currentIndex: mainViewProvider.getPage(),
            onTap: mainViewProvider.setPage,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 0,
            items: [BottomNavigationBarItem(
              label: "Make",
                activeIcon: BottomNavigationItem(
                    label: "Make",
                    activated: true,
                    iconData: ThemeIcons.make),
                icon: BottomNavigationItem(
                    label: "Make",
                    activated: false,
                    iconData: ThemeIcons.make),
               ),
               BottomNavigationBarItem(
                 label: "Search",
                activeIcon: BottomNavigationItem(
                    label: "Search",
                    activated: true,
                    iconData: ThemeIcons.search),
                icon: BottomNavigationItem(
                    label: "Search",
                    activated: false,
                    iconData: ThemeIcons.search),
              ),
              BottomNavigationBarItem(
                label: "Home",
                activeIcon: BottomNavigationItem(
                    label: "Home",
                    activated: true,
                    iconData: ThemeIcons.home),
                icon: BottomNavigationItem(
                    label: "Home",
                    activated: false,
                    iconData: ThemeIcons.home),
              ),
              BottomNavigationBarItem(
                label: "Social",
                activeIcon: BottomNavigationItem(
                    label: "Social",
                    activated: true,
                    iconData: ThemeIcons.social),
                icon: BottomNavigationItem(
                    label: "Social",
                    activated: false,
                    iconData: ThemeIcons.social),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                activeIcon: BottomNavigationItem(
                    label: "Settings",
                    activated: true,
                    iconData: ThemeIcons.settings),
                icon: BottomNavigationItem(
                    label: "Settings",
                    activated: false,
                    iconData: ThemeIcons.settings),
              ),
            ],
          );
        }
      ),
    );
  }
}

Widget fragment(int page) {
  switch (page){
    case 0: return Make();
    case 1: return Search();
    case 2: return Home();
    case 3: return Social();
    case 4: return Settings();
    default: return Placeholder();
  }
}