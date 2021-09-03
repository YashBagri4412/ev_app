import 'package:flutter/material.dart';
import 'package:ui_app/screens/drawer_screen.dart';
import 'package:ui_app/widgets/CustomCard.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        'Starya E-bike',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: DrawerScreen(),
      body: ListView(
        children: [
          Icon(
            Icons.person_outlined,
            color: Colors.white,
            size: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Name',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          CustomCard(
            text1: 'Vehicle Information',
            leadicon1: Icon(
              Icons.directions_car,
              color: Colors.black,
              size: 30,
            ),
          ),
          CustomCard(
            text1: 'Vechicle Logs',
            leadicon1: Icon(
              Icons.car_rental,
              color: Colors.black,
              size: 30,
            ),
          ),
          CustomCard(
            text1: 'Synchronise with Cloud',
            leadicon1: Icon(
              Icons.cloud,
              color: Colors.black,
              size: 30,
            ),
          ),
          CustomCard(
            text1: 'Travel History',
            leadicon1: Icon(
              Icons.card_travel,
              color: Colors.black,
              size: 30,
            ),
          ),
          CustomCard(
            text1: 'Maintenance',
            leadicon1: Icon(
              Icons.car_repair,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
