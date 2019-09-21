import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/color_list_bloc.dart';
import 'package:flutter_bloc_demo/bloc/current_color_bloc.dart';
import 'package:flutter_bloc_demo/components/bottom_navigation/bottom_nav_custom.dart';
import 'package:flutter_bloc_demo/components/random_color_card.dart';
import 'package:flutter_bloc_demo/routes.dart';

class ColorGeneratorPage extends StatefulWidget {
  ColorGeneratorPage({Key key}) : super(key: key);

  _ColorGeneratorPageState createState() => _ColorGeneratorPageState();
}

class _ColorGeneratorPageState extends State<ColorGeneratorPage> {
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
    return Scaffold(
        appBar: AppBar(
            title: Text(Routes.COLOR_GENERATOR.name),
            automaticallyImplyLeading: false),
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [RandomColorCard(), _renderAddToListButton()])),
        bottomNavigationBar: BottomNavBarCustom(currentLocation: 1));
  }

  Widget _renderAddToListButton() {
    return Container(
        height: 100,
        child: Center(
          child: RaisedButton(
            child: Text("Add to List"),
            onPressed: _onAddToList,
          ),
        ));
  }

  void _onAddToList() {
    BlocProvider.of<ColorListBloc>(context).addColor(_currentColor);
  }
}
