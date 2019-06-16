// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/widgets.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:wakey_wakey/wakey.dart';
import 'package:wakey_wakey/listView.dart';





void printMessage(String msg) => print('[${DateTime.now()}] $msg');


AudioPlayer player = new AudioPlayer(); // create this
AudioCache cache = new AudioCache();

void playLocal() async {
  String localPath ='mp3/audio2.mp3';
  player= await cache.play(localPath);
}

void stopAlarm() {
  player.stop();
}


Future<void> main() async {
  final int periodicID = 0;
  final int oneShotID = 1;

  // Start the AlarmManager service.
  await AndroidAlarmManager.initialize();


  printMessage("main run");
 /*runApp( MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Wakey Wakey'),
          ),
          body: Wakey()
        //Text('${DateTime.now()} dopo 15 sec deve smettere audio play', textDirection: TextDirection.ltr)
       )
      )
  );*/
  runApp( MyAlarms() );

  /*await AndroidAlarmManager.periodic(
      const Duration(seconds: 15), periodicID, stopAlarm,wakeup: true);
  await AndroidAlarmManager.oneShot(
      const Duration(seconds: 5), oneShotID, playLocal);*/
  /*final int helloAlarmID = 0;
  await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, playLocal);*/

  await AndroidAlarmManager.periodic(
      const Duration(minutes: 1), periodicID, playLocal,wakeup: true);

  /*await AndroidAlarmManager.periodic(
      const Duration(minutes: 2), periodicID, stopAlarm,wakeup: true);*/

  //https://stackoverflow.com/questions/54149840/flutter-android-alarm-manager-not-working
  /*
  *   await AndroidAlarmManager.periodic(
      const Duration(minutes: 1), periodicID, playLocal,wakeup: true).then((val) => print(val));*/
}





