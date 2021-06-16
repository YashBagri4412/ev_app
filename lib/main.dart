import 'package:ev_app/screens/bluetooth_scan_screen.dart';
import 'package:ev_app/screens/dashboard_screen.dart';
import 'package:ev_app/screens/info_screen.dart';
import 'package:ev_app/screens/permission_access.dart';
import 'package:ev_app/screens/profile_screen.dart';
import 'package:ev_app/widgets/Tabs_widget.dart';
import 'package:ev_app/widgets/bluetooth_state_checker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
//Relative imports
import 'provider/auth_provider.dart';
import 'screens/auth_screen.dart';
import 'provider/bluetooth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationFirebase>(
          create: (_) => AuthenticationFirebase(),
        ),
        ChangeNotifierProvider(
          create: (_) => BluetoothProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.white,
          canvasColor: Color(0xff020227).withBlue(40),
          textTheme: TextTheme(
            bodyText1: GoogleFonts.openSans(
              color: Colors.white,
            ),
            headline3: GoogleFonts.openSans(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
            headline6: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            subtitle1: GoogleFonts.openSans(
              color: Colors.white,
            ),
            caption: GoogleFonts.openSans(
              color: Colors.white,
            ),
          ),
        ),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => BluetoothScanScreen(),
          );
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, userSnapShot) {
            if (userSnapShot.hasData) {
              return BluetoothStateChecker();
            }
            return AuthScreen();
          },
        ),
        //debugShowCheckedModeBanner: false,
        routes: {
          InfoPage.routeName: (ctx) => InfoPage(),
          BluetoothScanScreen.routeName: (ctx) => BluetoothScanScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          DashboardScreen.routeName: (ctx) => DashboardScreen(),
          PermissionAccessScreen.routeName: (ctx) => PermissionAccessScreen(),
          TabsScreen.routeName: (ctx) => TabsScreen(),
        },
      ),
    );
  }
}
