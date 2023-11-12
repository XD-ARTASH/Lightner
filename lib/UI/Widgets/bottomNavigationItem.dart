import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool activated;

  const BottomNavigationItem(
      {Key? key,
        required this.label,
        required this.activated,
        required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: activated ? Colors.black : Colors.grey,
          size: width * 0.0426,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 10,
              color: activated ? Colors.black : Colors.grey,
          ),
        )
      ],
    );
  }
}