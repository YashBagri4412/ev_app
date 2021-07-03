import 'package:flutter_blue/flutter_blue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Relative Imports
import '../provider/bluetooth_provider.dart';
import '../widgets/Scan_Result_Tile.dart';
import './sensor_page.dart';

class BluetoothScanScreen extends StatelessWidget {
  //screen where all available bluetoooth devices are seen and then connected
  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<BluetoothProvider>(context).blue;
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Devices"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => scanProvider.startScan(timeout: Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<ScanResult>>(
                stream: scanProvider.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            print(r.device.name);
                            return SensorPage(device: r.device);
                          })),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: scanProvider.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => scanProvider.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: () => scanProvider.startScan(
                timeout: Duration(seconds: 4),
              ),
            );
          }
        },
      ),
    );
  }
}
