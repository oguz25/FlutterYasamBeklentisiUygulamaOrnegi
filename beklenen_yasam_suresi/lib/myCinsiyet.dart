import 'package:flutter/material.dart';

import 'constants.dart';

class MyCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;
  MyCinsiyet({this.cinsiyet, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        Text(
          cinsiyet,
          style: kMetinStili,
        ),
      ],
    );
  }
}
