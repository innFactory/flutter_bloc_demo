import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/color_list_bloc.dart';
import 'package:flutter_bloc_demo/components/bottom_navigation/bottom_nav_custom.dart';
import 'package:flutter_bloc_demo/routes.dart';

class ColorListPage extends StatelessWidget {
  const ColorListPage({Key key}) : super(key: key);
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
              onPressed: () => _onDeleteAll(context),
            ),
          ],
        ),
        body: _renderGrid(context),
        bottomNavigationBar: BottomNavBarCustom(currentLocation: 2));
  }

  Widget _renderGrid(BuildContext context) {
    ColorListBloc colorListBloc = BlocProvider.of<ColorListBloc>(context);

    return StreamBuilder(
        initialData: [],
        stream: colorListBloc.colorListObservable,
        builder: (BuildContext context, snapShot) => GridView.count(
            crossAxisCount: 5,
            children: List<Widget>.from(snapShot.data.map((c) => Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(20.0),
                  color: c,
                  margin: EdgeInsets.all(1.0),
                )))));
  }

  void _onDeleteAll(BuildContext context) {
    BlocProvider.of<ColorListBloc>(context).deleteAllColors();
  }
}
