import 'package:flutter/material.dart';
//import 'package:ui_app/screens/testing_custom_gauge.dart';
import '../screens/dashboard_page.dart';
import '../screens/profile_page.dart';
import '../screens/info_page.dart';

class DrawerScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: Text(
                'Your name',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(InfoScreen.routeName);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(DashboardScreen.routeName);
            },
            leading: Icon(
              Icons.donut_small_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Dashboard',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
/*
          ListTile(
            onTap: () {
              //Navigator.of(context).pushReplacementNamed(CGauge.routeName);
            },
            leading: Icon(
              Icons.donut_small_outlined,
              color: Colors.white,
            ),
            title: Text(
              'TDashboard',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),*/
        ],
      ),
    );
  }
}
