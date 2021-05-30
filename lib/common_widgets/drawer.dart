import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer_list_tile.dart';
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
              automaticallyImplyLeading: false,
              leading:
              IconButton(
                icon: Image.asset(kBurgerIconDrawer),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              title: Text(
                'Brinder',
                style: kAppBarTextStyle,
              ),
            ),
            Divider(),
            DrawerListTile(
              sectionName: 'Home',
              onItemTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomePageScreen.routeName);
              },
            ),
            DrawerListTile(
              sectionName: 'My Profile',
              onItemTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(UserProfileScreen.routeName);
              },
            ),
            DrawerListTile(
              sectionName: 'Search',
              onItemTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SearchScreen.routeName);
              },
            ),
            DrawerListTile(
              sectionName: 'Messages',
              onItemTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(MessagesScreen.routeName);
              },
            ),
            DrawerListTile(
              sectionName: 'Favourites',
              onItemTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavouritesScreen.routeName);
              },
            ),
            DrawerListTile(
              sectionName: 'Settings',
              onItemTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
