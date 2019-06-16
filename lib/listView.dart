import 'package:flutter/material.dart';
import 'package:wakey_wakey/model/Alarm.dart';



class MyAlarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Wakey Wakey',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Wakey-Wakey'),
          ),
          body: Container(child: MyListView()),
          floatingActionButton: Transform.scale(
            scale: 1.5,
            child: FloatingActionButton(
              onPressed: () {
                _showModalSheet(context);
              },
              child: Icon(Icons.add_alarm),
              backgroundColor: Colors.green,
            ),
          )),
    );
  }
}

void _showModalSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: Text('Hello From Modal Bottom Sheet'),
          padding: EdgeInsets.all(40.0),
        );
      });
}


class MyListView extends StatelessWidget {

  List<Alarm> _alarms = []
    ..add(Alarm('7:00','am',true))
    ..add(Alarm('7:30','am',false))
    ..add(Alarm('8:00','am',true))
    ..add(Alarm('8:30','am',true))
    ..add(Alarm('9:00','am',true));

 // List<MyListItem> _buildAlarmList() => _alarms.map((al) => MyListItem(al)).toList();
  Widget _buildAlarmItem(BuildContext context, int index) {
    return MyListItem(_alarms[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _alarms.length,
      itemBuilder: _buildAlarmItem
    );
  }

  }



class MyListItem extends StatefulWidget {

  Alarm alarm;

  //MyListItem({Key key, @required this.alarm}) : super(key: key);
  MyListItem(this.alarm);

  @override
  MyListItemState createState() => new MyListItemState(alarm);
}

class MyListItemState extends State<MyListItem> {
  Alarm alarm ;

  MyListItemState(this.alarm);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '${alarm.time}',
                        style: TextStyle(
                          fontFamily: "Rock Salt",
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        '  ${alarm.amPm}',
                        style: TextStyle(
                          fontFamily: "Rock Salt",
                          fontSize: 15.0,

                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(top: 5.0, right: 16.0),
                          child: new CircleAvatar(child: new Text('Mon')),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 5.0, right: 16.0),
                          child: new CircleAvatar(child: new Text('Tue')),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 5.0, right: 16.0),
                          child: new CircleAvatar(child: new Text('Wed')),
                        ),
                      ])
                ],
              ),
            ),
            Spacer(),
            Transform.scale(
              scale: 1.5,
              alignment: Alignment.center,
              child: Switch(
                value: alarm.isSwitched,
                onChanged: (value) {
                  setState(() {
                    alarm.isSwitched = value;
                  });
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert Dialog title"),
        content: new Text("Alert Dialog body"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
