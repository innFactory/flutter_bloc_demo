import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/color_list_bloc.dart';
import 'package:flutter_bloc_demo/bloc/current_color_bloc.dart';
import 'package:flutter_bloc_demo/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'Bloc Demo',
      initialRoute: '/',
      navigatorKey: navigatorKey,
      routes: Routes.routes.map((route, _route) {
        return MapEntry(route, _route.page);
      }),
      builder: (context, widget) {
        return BlocProvider(
            bloc: ColorListBloc(),
            child: BlocProvider(bloc: CurrentColorBloc(), child: widget));
      },
    );
  }
}
