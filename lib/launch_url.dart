import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Fehler beim Öffnen der Website:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(padding: EdgeInsets.all(10), child: Text(url))
              ],
            ));
  }
}

void launchMail(BuildContext context, String mailAdress) async {
  String normalized = mailAdress.replaceAll("E-Mail:", "");
  normalized = normalized.trim();

  if (await canLaunch('mailto:' + normalized)) {
    await launch('mailto:' + normalized);
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "E-Mail konnte nicht geöffnet werden:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(padding: EdgeInsets.all(10), child: Text(mailAdress))
              ],
            ));
  }
}

void launchPhone(BuildContext context, String phoneNumber) async {
  String normalized = phoneNumber.replaceAll("(0)", "");
  normalized = normalized.replaceAll(RegExp("\\D"), "");
  if (phoneNumber.contains("+")) {
    normalized = "+" + normalized;
  }

  if (await canLaunch('tel:' + normalized)) {
    await launch('tel:' + normalized);
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Telefonnummer konnte nicht geöffnet werden:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(padding: EdgeInsets.all(10), child: Text(phoneNumber))
              ],
            ));
  }
}

void launchMap(BuildContext context, double lat, double lon) async {
  if (await canLaunch("google.navigation:q=$lat,$lon")) {
    await launch("google.navigation:q=$lat,$lon");
  } else {
    // try apple maps
    var urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lon';
    if (await canLaunch(urlAppleMaps)) {
      await launch(urlAppleMaps);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => SimpleDialog(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Fehler beim Öffnen der Karte:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("lat: $lat, lon: $lon"))
                ],
              ));
    }
  }
}
