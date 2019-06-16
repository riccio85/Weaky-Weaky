import 'package:flutter/material.dart';
//import 'package:speech_recognition/speech_recognition.dart';
import 'dart:async';


class InsertModalDemo extends StatefulWidget {
@override
_InsertModalDemoState createState() => _InsertModalDemoState();
}

class _InsertModalDemoState extends State<InsertModalDemo> {

  void _showModalSheet() {
    showModalBottomSheet(context: context, builder: (builder) {
      return Container(
        child: Text('Hello From Modal Bottom Sheet'),
        padding: EdgeInsets.all(40.0),
      );
    });
  }

  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
            onPressed: _showModalSheet,
            child: const Text('Show Modal Bottom Sheet')
        )

    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Modal bottom sheet')
        ),
        body: Center(
            child: RaisedButton(
                onPressed: _showModalSheet,
                child: const Text('Show Modal Bottom Sheet')
            )
        )
    );
  }
  */
}