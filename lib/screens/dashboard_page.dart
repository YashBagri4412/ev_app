import 'package:flutter/material.dart';
import 'package:ui_app/screens/drawer_screen.dart';
import 'package:ui_app/widgets/CircularGauge.dart';
import 'package:ui_app/widgets/Speedometer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://miniproject-msrit.herokuapp.com/ws2'),
  );

/*
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
*/
  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final islandscape = mediaquery.orientation == Orientation.landscape;
    final appBar = AppBar(
      centerTitle: true,
      title: Text('Starya E-bike'),
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: DrawerScreen(),
      body: StreamBuilder(
          stream: _channel.stream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final response = jsonDecode(snapshot.data.toString());
              if (islandscape)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularGauge(
                      value: response['BATTERY'].toDouble(),
                    ),
                    Container(
                      width: (mediaquery.size.width) * 0.5,
                      padding: EdgeInsets.all(10),
                      height: (mediaquery.size.height) * 0.9,
                      child: SpeedometerView(
                        unitOfMeasurementTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        minMaxTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        divisionCircleColors: Colors.white,
                        innerCirclePadding: 16,
                        speedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                        ),
                        alertColorArray: [
                          Colors.green,
                          Colors.green,
                          Colors.orange,
                          Colors.orange,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                        ],
                        alertSpeedArray: [
                          0.0,
                          20.0,
                          40.0,
                          60.0,
                          80.0,
                          100.0,
                          120.0,
                        ],
                        speed: response['SPEED'].toDouble(),
                      ),
                    ),
                    Container(
                      width: (mediaquery.size.width) * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Fault',
                            style: Theme.of(context).textTheme.subtitle1.apply(
                                  color: response['FAULT_VALUE'] == 1
                                      ? Colors.red
                                      : Colors.grey[600],
                                ),
                          ),
                          Icon(
                            Icons.battery_alert_outlined,
                            color: response['FAULT_VALUE'] == 1
                                ? Colors.red
                                : Colors.grey[600],
                            size: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'Average Speed',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '40 Kmph',
                                style:
                                    Theme.of(context).textTheme.bodyText1.apply(
                                          color: Colors.white70,
                                        ),
                              ),
                              Text(
                                'Total Distance',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '${response['TOTAL_DISTANCE']} Kms',
                                style:
                                    Theme.of(context).textTheme.bodyText1.apply(
                                          color: Colors.white70,
                                        ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: CircularGauge(
                      value: response['BATTERY'].toDouble(),
                    ),
                  ),
                  Container(
                    height: (mediaquery.size.height -
                            appBar.preferredSize.height -
                            mediaquery.padding.top) *
                        0.5,
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    child: SpeedometerView(
                      unitOfMeasurementTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      minMaxTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      divisionCircleColors: Colors.white,
                      innerCirclePadding: 16,
                      speedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                      ),
                      alertColorArray: [
                        Colors.green,
                        Colors.green,
                        Colors.orange,
                        Colors.orange,
                        Colors.red,
                        Colors.red,
                        Colors.red,
                      ],
                      alertSpeedArray: [
                        0.0,
                        20.0,
                        40.0,
                        60.0,
                        80.0,
                        100.0,
                        120.0,
                      ],
                      speed: response['SPEED'].toDouble(),
                    ),
                  ),
                  Container(
                    height: (mediaquery.size.height -
                            appBar.preferredSize.height -
                            mediaquery.padding.top) *
                        0.2,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Fault',
                          style: Theme.of(context).textTheme.subtitle1.apply(
                                color: response['FAULT_VALUE'] == 1
                                    ? Colors.red
                                    : Colors.grey[600],
                              ),
                        ),
                        Icon(
                          Icons.battery_alert_outlined,
                          color: response['FAULT_VALUE'] == 1
                              ? Colors.red
                              : Colors.grey[600],
                          size: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              'Average Speed',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '40 Kmph',
                              style:
                                  Theme.of(context).textTheme.bodyText1.apply(
                                        color: Colors.white70,
                                      ),
                            ),
                            Text(
                              'Total Distance',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '${response['TOTAL_DISTANCE']} Kms',
                              style:
                                  Theme.of(context).textTheme.bodyText1.apply(
                                        color: Colors.white70,
                                      ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).canvasColor,
              ),
            );
          }),
    );
  }
}
