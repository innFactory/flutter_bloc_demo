import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/current_color_bloc.dart';

class RandomColorCard extends StatefulWidget {
  RandomColorCard({Key key}) : super(key: key);

  _RandomColorCardState createState() => _RandomColorCardState();
}

class _RandomColorCardState extends State<RandomColorCard> {
  StreamSubscription<Color> _currentColorListener;
  Color _currentColor;

  @override
  void initState() {
    super.initState();

    // listen to offers from bloc
    this.initListeners();
  }

  void initListeners() {
    this._currentColorListener = BlocProvider.of<CurrentColorBloc>(context)
        .colorObservable
        .listen(this._updateColor);
  }

  @override
  void dispose() {
    if (_currentColorListener != null) {
      _currentColorListener.cancel();
    }
    super.dispose();
  }

  void _updateColor(Color c) {
    this.setState(() {
      this._currentColor = c;
    });
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
    BlocProvider.of<CurrentColorBloc>(context).generateColor();
  }
}
