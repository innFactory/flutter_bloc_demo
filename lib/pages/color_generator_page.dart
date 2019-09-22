import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/color_list_bloc.dart';
import 'package:flutter_bloc_demo/bloc/current_color_bloc.dart';
import 'package:flutter_bloc_demo/components/bottom_navigation/bottom_nav_custom.dart';
import 'package:flutter_bloc_demo/routes.dart';

class ColorGeneratorPage extends StatelessWidget {
  const ColorGeneratorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(Routes.COLOR_GENERATOR.name),
            automaticallyImplyLeading: false),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(), // TODO: Replace this container with a RandomColorCard(),
          _renderAddToListButton(context)
        ])),
        bottomNavigationBar: BottomNavBarCustom(currentLocation: 1));
  }

  Widget _renderAddToListButton(BuildContext context) {
    CurrentColorBloc currentColorBloc =
        BlocProvider.of<CurrentColorBloc>(context);

    return Container(
        height: 100,
        child: Center(
            child: StreamBuilder(
          initialData: Colors.red,
          stream: currentColorBloc.colorObservable,
          builder: (BuildContext context, snapShot) => RaisedButton(
            child: Text("Add to List"),
            onPressed: () => _onAddToList(context, snapShot.data),
          ),
        )));
  }

  void _onAddToList(BuildContext context, Color currentColor) {
    BlocProvider.of<ColorListBloc>(context).addColor(currentColor);
  }
}
