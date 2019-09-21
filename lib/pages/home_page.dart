import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_demo/components/bottom_navigation/bottom_nav_custom.dart';
import 'package:flutter_bloc_demo/launch_url.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _renderInnFactory(context),
            _renderMeetupGroup(context, "https://www.meetup.com/de-DE/GDG-BGL/",
                "Google Developer Group BGL", "assets/bgl_meetup_group.png"),
            Container(height: 5),
            _renderMeetupGroup(
                context,
                "https://www.meetup.com/de-DE/innovation-now/",
                "innovation:now meetup",
                "assets/innovationnow_meetup_group.png")
          ],
        )),
        bottomNavigationBar: BottomNavBarCustom(currentLocation: 0));
  }

  Widget _renderInnFactory(BuildContext context) {
    return FlatButton(
      onPressed: () => launchURL(context, "https://innFactory.de"),
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset("assets/innFactory.png")),
      ),
    );
  }

  Widget _renderMeetupGroup(
      BuildContext context, String url, String title, String image) {
    return Container(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () => launchURL(context, url),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Image.asset(
                  image,
                  height: 100,
                )),
            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    ));
  }
}
