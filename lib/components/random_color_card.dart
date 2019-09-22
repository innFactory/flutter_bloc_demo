import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomColorCard extends StatefulWidget {
  RandomColorCard({Key key}) : super(key: key);

  _RandomColorCardState createState() => _RandomColorCardState();
}

class _RandomColorCardState extends State<RandomColorCard> {
  Color _currentColor;

  @override
  void initState() {
    super.initState();

    _currentColor = _generateRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onTap,
        child: Container(
          height: 200,
          width: 200,
          child: Card(
              color: _currentColor,
              child: Center(
                child: Text(
                  "Tap here to generate a new color",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
        ));
  }

  void _onTap() {
    setState(() {
      _currentColor = _generateRandomColor();
    });
  }

  static Color _generateRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
  }
}
