import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/color_list_bloc.dart';
import 'package:flutter_bloc_demo/components/bottom_navigation/bottom_nav_custom.dart';
import 'package:flutter_bloc_demo/routes.dart';

class ColorListPage extends StatefulWidget {
  ColorListPage({Key key}) : super(key: key);

  _ColorListPageState createState() => _ColorListPageState();
}

class _ColorListPageState extends State<ColorListPage> {
  StreamSubscription<List<Color>> _colorListListener;
  List<Color> _colorList;

  @override
  void initState() {
    super.initState();

    // listen to offers from bloc
    this.initListeners();
  }

  void initListeners() {
    this._colorListListener = BlocProvider.of<ColorListBloc>(context)
        .colorListObservable
        .listen(this._updateColorList);
  }

  @override
  void dispose() {
    if (_colorListListener != null) {
      _colorListListener.cancel();
    }
    super.dispose();
  }

  void _updateColorList(List<Color> colorList) {
    this.setState(() {
      this._colorList = colorList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Routes.COLOR_LIST.name),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete_forever),
              tooltip: 'Delete all colors',
              onPressed: _onDeleteAll,
            ),
          ],
        ),
        body: _colorList != null ? _renderGrid() : SizedBox.shrink(),
        bottomNavigationBar: BottomNavBarCustom(currentLocation: 2));
  }

  Widget _renderGrid() {
    return GridView.count(
        crossAxisCount: 5,
        children: _colorList
            .map((c) => Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(20.0),
                  color: c,
                  margin: EdgeInsets.all(1.0),
                ))
            .toList());
  }

  void _onDeleteAll() {
    BlocProvider.of<ColorListBloc>(context).deleteAllColors();
  }
}
