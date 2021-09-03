import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionAccessScreen extends StatelessWidget {
  static const routeName = '/PermissionAccessScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Spacer(
            flex: 4,
          ),
          Center(
            child: Text(
              "Turn On Bluetooth",
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Turn on the Bluetooth to check vehicle info",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Icon(
            Icons.bluetooth_disabled,
            color: Colors.grey[600],
            size: 100,
          ),
          // Container(
          //   padding: EdgeInsets.only(
          //     left: 20,
          //     right: 20,
          //   ),
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all<Color>(
          //         Colors.blue[400],
          //       ),
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(18.0),
          //         ),
          //       ),
          //     ),
          //     onPressed: () {},
          //     child: Text(
          //       "Continue",
          //       style: GoogleFonts.openSans(
          //         fontWeight: FontWeight.w500,
          //         color: Colors.black,
          //         fontSize: 18,
          //       ),
          //     ),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     "Not now",
          //     style: GoogleFonts.openSans(
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 12,
          // ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
