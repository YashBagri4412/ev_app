import 'package:flutter/material.dart';

class CircularGauge extends StatelessWidget {
  final value;
  CircularGauge({this.value});
  final List<Color> gradcolor = [
    Colors.red,
    Colors.grey.withAlpha(55),
  ];
  retcolor() {
    if ((value).ceil() >= 80) {
      List<Color> gradcolor = [
        Colors.green[400],
        Colors.grey.withAlpha(55),
      ];
      return gradcolor;
    }
    if ((value).ceil() >= 60) {
      List<Color> gradcolor = [
        Colors.yellow[600],
        Colors.grey.withAlpha(55),
      ];
      return gradcolor;
    }
    if ((value).ceil() >= 40) {
      List<Color> gradcolor = [
        Colors.orange,
        Colors.grey.withAlpha(55),
      ];
      return gradcolor;
    }
    return gradcolor;
  }

  @override
  Widget build(BuildContext context) {
    int percent = (value).ceil();
    return Container(
      height: 150,
      width: 150,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                startAngle: 0.0,
                endAngle: 3.14 * 2,
                stops: [value / 100, value / 100],
                center: Alignment.center,
                colors: retcolor(),
              ).createShader(rect);
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.bolt,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: Text(
                    '$percent%',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
