import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text1;
  final Icon leadicon1;
  CustomCard({this.text1, this.leadicon1});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            text1,
            style: Theme.of(context).textTheme.bodyText1.apply(
                  color: Colors.black,
                ),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.blue,
            size: 30,
          ),
          leading: leadicon1,
        ),
      ),
    );
  }
}
