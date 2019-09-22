import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/bloc_provider.dart';
import 'package:flutter_bloc_demo/bloc/current_color_bloc.dart';

class RandomColorCard extends StatelessWidget {
  const RandomColorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentColorBloc currentColorBloc =
        BlocProvider.of<CurrentColorBloc>(context);

    return GestureDetector(
        onTap: () => _onTap(context),
        child: Container(
          height: 200,
          width: 200,
          child: StreamBuilder(
              initialData: Colors.red,
              stream: currentColorBloc.colorObservable,
              builder: (BuildContext context, snapShot) => Card(
                  color: snapShot.data,
                  child: Center(
                    child: Text(
                      "Tap here to generate a new color",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ))),
        ));
  }

  void _onTap(BuildContext context) {
    BlocProvider.of<CurrentColorBloc>(context).generateColor();
  }
}
