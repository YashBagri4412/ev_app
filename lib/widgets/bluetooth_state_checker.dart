import 'package:ev_app/screens/bluetooth_scan_screen.dart';
import 'package:ev_app/screens/turn_bluetooth_on.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
//Relative Import
import '../provider/bluetooth_provider.dart';

class BluetoothStateChecker extends StatelessWidget {
  //checks whether bluetooth is on or off
  //haults the operation if off with permission access screen
  //otherwise moves to bluetooth_scan_screen
  @override
  Widget build(BuildContext context) {
    final bluetoothProvider = Provider.of<BluetoothProvider>(context).blue;
    return StreamBuilder(
      builder: (context, stateSnapshot) {
        if (stateSnapshot.data == BluetoothState.turningOn ||
            stateSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
            )),
          );
        }
        if (stateSnapshot.data == BluetoothState.on) {
          return BluetoothScanScreen();
        } else {
          return TunrBluetoothOn();
        }
      },
      stream: bluetoothProvider.state,
    );
  }
}
