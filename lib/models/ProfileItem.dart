import 'package:flutter/material.dart';

class Item {
  String expandedval;
  String headerval;
  bool isExpanded;
  Icon icondata;
  Item({
    this.expandedval,
    this.headerval,
    this.isExpanded: false,
    this.icondata,
  });
}
