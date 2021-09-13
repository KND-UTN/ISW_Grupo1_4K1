import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: LoQueSeaMenu(),
    );
  }
}

class LoQueSeaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150.0,
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          gradient: new LinearGradient(
              colors: [Colors.yellow, Colors.redAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp)),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0),
              child: new CircleAvatar(
                radius: 35.0,
                backgroundImage:
                    NetworkImage('https://wallpapercave.com/wp/wp2365076.jpg'),
              )),
          new Expanded(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'New York',
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              new SizedBox(
                height: 8.0,
              ),
              new Text(
                'Sunny',
                style: new TextStyle(fontSize: 12.0, color: Colors.white70),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Text('2342',
                          style: new TextStyle(
                              fontSize: 12.0, color: Colors.white)),
                      new Text('Popularity',
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.white)),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text('2342',
                          style: new TextStyle(
                              fontSize: 12.0, color: Colors.white)),
                      new Text('Like',
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.white)),
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text('2342',
                          style: new TextStyle(
                              fontSize: 12.0, color: Colors.white)),
                      new Text('Followed',
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.white)),
                    ],
                  )
                ],
              )
            ],
          )),
          new Padding(
              padding: new EdgeInsets.only(left: 10.0, right: 10.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    '12°',
                    style: new TextStyle(fontSize: 30.0, color: Colors.white70),
                  ),
                  new Text(
                    'Ranking',
                    style: new TextStyle(fontSize: 14.0, color: Colors.white70),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
