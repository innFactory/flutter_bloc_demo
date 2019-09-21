import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CurrentColorBloc extends BlocBase {
  BehaviorSubject<Color> _currentColorPublisher;

  CurrentColorBloc() {
    this._initPublisher();
  }

  Observable<Color> get colorObservable => this._currentColorPublisher.stream;

  void _initPublisher() {
    this._currentColorPublisher =
        BehaviorSubject<Color>.seeded(_generateRandomColor());
  }

  Observable<Color> get displaySplashScreenObservable =>
      this._currentColorPublisher.stream;

  void generateColor() {
    this._currentColorPublisher.sink.add(_generateRandomColor());
  }

  void dispose() {
    _currentColorPublisher.close();
  }

  static Color _generateRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
  }
}
