import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/components/bottom_navigation/no_animation_page_builder.dart';
import 'package:flutter_bloc_demo/routes.dart';

abstract class BottomNavItems {
  static const HOME = 0;
  static const COLOR_GENERATOR = 1;
  static const COLOR_LIST = 2;
}

class BottomNavBarCustom extends StatelessWidget {
  final int currentLocation;

  BottomNavBarCustom({@required this.currentLocation, Key key})
      : assert(currentLocation != null),
        super(key: key);

  handleNavigation(BuildContext context, int nextLocation) {
    if (nextLocation == BottomNavItems.HOME) {
      Navigator.pushAndRemoveUntil(
          context,
          NoAnimationPageBuilder(widget: Routes.HOME.page(context)),
          ModalRoute.withName(Routes.HOME.route));
    } else {
      Navigator.popUntil(context, ModalRoute.withName(Routes.HOME.route));
      if (nextLocation == BottomNavItems.COLOR_GENERATOR) {
        Navigator.push(
            context,
            NoAnimationPageBuilder(
                widget: Routes.COLOR_GENERATOR.page(context)));
      } else if (nextLocation == BottomNavItems.COLOR_LIST) {
        Navigator.push(context,
            NoAnimationPageBuilder(widget: Routes.COLOR_LIST.page(context)));
      } else {
        Navigator.push(
            context, NoAnimationPageBuilder(widget: Routes.HOME.page(context)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: this.currentLocation,
      onTap: (nextLocation) => handleNavigation(context, nextLocation),
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.4),
      selectedItemColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          title: Text("Generator"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text("List"),
        ),
      ],
    );
  }
}
