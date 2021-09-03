import 'package:flutter/material.dart';
import 'package:ui_app/screens/drawer_screen.dart';
import 'package:ui_app/widgets/GaugeDisplay_widget.dart';
import '../widgets/line_chart_widget.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class InfoScreen extends StatefulWidget {
  static const routeName = '/InfoScreen';
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://miniproject-msrit.herokuapp.com/ws2'),
  );
  bool _showGraph = false;
  final appBar = AppBar(
    centerTitle: true,
    title: Text(
      'Starya E-bike',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final islandscape = mediaquery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: appBar,
      endDrawer: DrawerScreen(),
      body: StreamBuilder(
          stream: _channel.stream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final response = jsonDecode(snapshot.data.toString());

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (islandscape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Show Distance Traveled',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Switch(
                          activeColor: Colors.red,
                          inactiveTrackColor: Colors.amber.withOpacity(0.3),
                          inactiveThumbColor: Colors.amber,
                          value: _showGraph,
                          onChanged: (val) {
                            setState(() {
                              _showGraph = val;
                            });
                          },
                        ),
                      ],
                    ),
                  if (!islandscape)
                    Container(
                      padding: EdgeInsets.all(8),
                      height: (mediaquery.size.height -
                              appBar.preferredSize.height -
                              mediaquery.padding.top) *
                          0.34,
                      child: GaugeInfo(
                        gaugeVal: response['BATTERY'].toDouble(),
                        rangeval: response['DISTANCE'],
                        tempVal: response['MOSFET_TEMP'],
                      ),
                    ),
                  if (!islandscape)
                    Container(
                      padding: EdgeInsets.all(15),
                      height: (mediaquery.size.height -
                              appBar.preferredSize.height -
                              mediaquery.padding.top) *
                          0.66,
                      width: double.infinity,
                      child: LineChartWidget(
                        values: [
                          [0.0, 0.2],
                          [1.0, 3.2],
                          [2.0, 1.5],
                          [3.0, 4.7],
                          [4.0, 2.1],
                          [5.0, 3.2],
                          [6.0, 2.0],
                        ],
                      ),
                    ),
                  if (islandscape)
                    !_showGraph
                        ? Container(
                            padding: EdgeInsets.all(8),
                            height: (mediaquery.size.height -
                                    appBar.preferredSize.height -
                                    mediaquery.padding.top) *
                                0.8,
                            child: GaugeInfo(
                              gaugeVal: response['BATTERY'].toDouble(),
                              rangeval: response['DISTANCE'],
                              tempVal: response['MOSFET_TEMP'],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(12),
                            height: (mediaquery.size.height -
                                    appBar.preferredSize.height -
                                    mediaquery.padding.top) *
                                0.7,
                            width: double.infinity,
                            child: LineChartWidget(
                              values: [
                                [0.0, 0.2],
                                [1.0, 3.2],
                                [2.0, 1.5],
                                [3.0, 4.7],
                                [4.0, 2.1],
                                [5.0, 3.2],
                                [6.0, 2.0],
                              ],
                            ),
                          ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).canvasColor,
                ),
              );
            }
          }),
    );
  }
}
