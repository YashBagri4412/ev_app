import 'package:ev_app/screens/bluetooth_scan_screen.dart';
import 'package:ev_app/screens/permission_access.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
//Relative Import
import '../provider/bluetooth_provider.dart';

class BluetoothStateChecker extends StatelessWidget {
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
          return PermissionAccessScreen();
        }
      },
      stream: bluetoothProvider.state,
    );
  }
}
