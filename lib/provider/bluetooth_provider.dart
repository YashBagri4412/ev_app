import 'package:flutter/cupertino.dart';

import 'package:flutter_blue/flutter_blue.dart';

class BluetoothProvider extends ChangeNotifier {
  FlutterBlue blue = FlutterBlue.instance;

  List<ScanResult> _list = [];
  List<ScanResult> get list => _list;
}
