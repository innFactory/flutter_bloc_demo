import 'package:flutter/material.dart';

class NoAnimationPageBuilder extends PageRouteBuilder {
  final Widget widget;

  NoAnimationPageBuilder({@required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              _createPageBuilder(
                  context, animation, secondaryAnimation, widget),
          transitionsBuilder: _createTransitionBuilder,
        );

  static Widget _createPageBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget page) {
    return page;
  }

  static Widget _createTransitionBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
