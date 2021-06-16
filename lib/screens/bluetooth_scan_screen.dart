import 'package:ev_app/widgets/Tabs_widget.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Relative Imports
import '../provider/bluetooth_provider.dart';
import '../widgets/Scan_Result_Tile.dart';

class BluetoothScanScreen extends StatelessWidget {
  static const routeName = '/BluetoothScanScreen';
  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<BluetoothProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Devices",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            scanProvider.blue.startScan(timeout: Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () => Navigator.of(context).pushNamed(
                              TabsScreen.routeName,
                              arguments: r.device),

/*
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            return InfoPage(
                              device: r.device,
                            );
                          }
                          )
                          ),*/
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
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: Icon(
                  Icons.search,
                  color: Color(0xff020227),
                ),
                onPressed: () => FlutterBlue.instance
                    .startScan(timeout: Duration(seconds: 4)));
          }
        },
      ),
    );
  }
}

/*
      //body content
      RefreshIndicator(
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
      */
