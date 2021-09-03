import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'M0';
              case 1:
                return 'Tu';
              case 2:
                return 'We';
              case 3:
                return 'Th';
              case 4:
                return 'Fr';
              case 5:
                return 'Sa';
              case 6:
                return 'Su';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      );
}
