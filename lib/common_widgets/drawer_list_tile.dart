import 'package:flutter/material.dart';
import 'package:matching_cats/screens/home_page_screen.dart';
import 'package:matching_cats/theme.dart';

class DrawerListTile extends StatelessWidget {
  final String sectionName;
  final Function onItemTap;

  const DrawerListTile({Key? key, required this.sectionName, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        sectionName,
        style: kDrawerTextStyle,
      ),
      onTap: () {
        onItemTap();
      },
    );
  }
}