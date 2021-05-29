import 'package:flutter/material.dart';
import 'package:matching_cats/theme.dart';
import 'package:matching_cats/screens/favourites_screen.dart';
import 'package:matching_cats/screens/home_page_screen.dart';
import 'package:matching_cats/screens/messages_screen.dart';
import 'package:matching_cats/screens/search_screen.dart';
import 'package:matching_cats/screens/settings_screen.dart';
import 'package:matching_cats/screens/user_profile_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundLaunchColor,
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Brinder',
                style: kAppBarTextStyle,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Home',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomePageScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'User Profile',
                style: kDrawerTextStyle,
              ),
              onTap: (){
                Navigator.of(context)
                    .pushReplacementNamed(UserProfileScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Search',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Messages',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(MessagesScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Favourites',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(FavouritesScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
