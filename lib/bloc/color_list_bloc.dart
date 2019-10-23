import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ColorListBloc extends BlocBase {
  BehaviorSubject<List<Color>> _colorListPublisher;
  List<Color> _colors = [];

  ColorListBloc() {
    this._initPublisher();
  }

  Observable<List<Color>> get colorListObservable =>
      this._colorListPublisher.stream;

  void _initPublisher() {
    this._colorListPublisher = BehaviorSubject<List<Color>>.seeded(_colors);
  }

  void addColor(Color color) {
    _colors.add(color);
    this._colorListPublisher.sink.add(_colors);
  }

  void deleteAllColors() {
    _colors.clear();
    this._colorListPublisher.sink.add(_colors);
  }

  void dispose() {
    _colorListPublisher.close();
  }
}
