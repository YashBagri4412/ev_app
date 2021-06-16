import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/DashboardScreen';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Dashboard',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
