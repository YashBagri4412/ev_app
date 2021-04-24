import 'package:flutter_blue/flutter_blue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Relative Imports
import '../provider/bluetooth_provider.dart';

class BluetoothScanScreen extends StatelessWidget {
  //screen where all available bluetoooth devices are seen and then connected
  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<BluetoothProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Devices"),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            scanProvider.blue.startScan(timeout: Duration(seconds: 4)),
        child: Column(
          children: [
            StreamBuilder<List<BluetoothDevice>>(
              stream: Stream.periodic(Duration(seconds: 2))
                  .asyncMap((_) => FlutterBlue.instance.connectedDevices),
              initialData: [],
              builder: (c, snapshot) {
                print(snapshot.data);
                return Column(
                  children: snapshot.data
                      .map((d) => ListTile(
                            title: Text(d.name),
                            subtitle: Text(d.id.toString()),
                            trailing: StreamBuilder<BluetoothDeviceState>(
                              stream: d.state,
                              initialData: BluetoothDeviceState.disconnected,
                              builder: (c, snapshot) {
                                return Text(snapshot.data.toString());
                              },
                            ),
                          ))
                      .toList(),
                );
              },
            ),
            StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, availableSnapshot) {
                  print(availableSnapshot.data);
                  return Column(
                    children: availableSnapshot.data
                        .map((r) => ListTile(
                              leading: Text(r.device.toString()),
                            ))
                        .toList(),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
    );
  }
}
