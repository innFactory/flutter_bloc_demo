import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/pages/color_generator_page.dart';
import 'package:flutter_bloc_demo/pages/color_list_page.dart';
import 'package:flutter_bloc_demo/pages/home_page.dart';

typedef ContextToPage = Widget Function(BuildContext);

class _Route {
  final String route; // route which the navigator pushes
  final ContextToPage page; // page where the navigator pushes to
  final String name; // name of the route, used e.g. in the drawer menu

  const _Route({this.route, this.page, this.name});
}

class Routes {
  // Route entries for MaterialApp routing

  static final Map<String, _Route> routes = Map.fromEntries({
    MapEntry<String, _Route>(HOME.route, HOME),
    MapEntry<String, _Route>(COLOR_GENERATOR.route, COLOR_GENERATOR),
    MapEntry<String, _Route>(COLOR_LIST.route, COLOR_LIST),
  });

  // Create Routes below -------------
  static _Route HOME = _Route(
    route: '/',
    page: (BuildContext context) => HomePage(),
    name: 'Home',
  );

  static _Route COLOR_GENERATOR = _Route(
    route: '/color_generator',
    page: (BuildContext context) => ColorGeneratorPage(),
    name: 'Generator',
  );

  static _Route COLOR_LIST = _Route(
    route: '/color_list',
    page: (BuildContext context) => ColorListPage(),
    name: 'List',
  );
}
