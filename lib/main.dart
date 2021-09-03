import 'package:flutter/material.dart';

import './screens/dashboard_page.dart';
import './screens/info_page.dart';
import './screens/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'provider/bluetooth_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/bluetooth_state_checker.dart';

void main() {
  runApp(MyApp());
}

// calculation size dynamically
// wrap with container and set its height to
// (mediaquery.of(context).size.height -appBar.preferredsize.height -
// mediaquery.of(context).padding.top)* 0.6
// textscalefactor
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BluetoothProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Starya E-bike',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.white,
          canvasColor: Color(0xFF2D2F41), //Color.fromRGBO(61, 70, 101, 0.6),
          textTheme: TextTheme(
            bodyText1: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 20,
            ),
            subtitle1: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 24,
            ),
            caption: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        home: BluetoothStateChecker(),
        routes: {
          DashboardScreen.routeName: (ctx) => DashboardScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          InfoScreen.routeName: (ctx) => InfoScreen(),
          
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
