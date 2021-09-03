import 'package:flutter/material.dart';
import './CircularGauge.dart';

class GaugeInfo extends StatelessWidget {
  final gaugeVal;
  final rangeval;
  final tempVal;
  GaugeInfo(
      {@required this.gaugeVal,
      @required this.rangeval,
      @required this.tempVal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularGauge(
          value: gaugeVal,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${rangeval}Kms',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '$tempVal°C',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Range',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              'Battery Temperature',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
