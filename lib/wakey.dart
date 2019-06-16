import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:flare_flutter/flare_actor.dart";

class Wakey extends StatefulWidget {
  //Wakey({Key key, this.title}) : super(key: key);
  //final String title;
  //Wakey(title: 'Flutter Time Demo')  dove si usa
  @override
  _WakeyState createState() => _WakeyState();
}

class _WakeyState extends State<Wakey> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return FlareActor("animations/recorder.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "rotate_scale_color");
    /*return Center(
      child: Column /*or Column*/ (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlareActor("animations/recorder.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "rotate_scale_color"),
          Text(_timeString),
        ],
      ),
    );*/
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}
