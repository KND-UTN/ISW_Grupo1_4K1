import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliverEat',
      home: OkScreen(),
    );
  }
}

class OkScreen extends StatefulWidget {
  @override
  _OkScreenState createState() => _OkScreenState();
}

class _OkScreenState extends State<OkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff88e597),
      body: Center(
        child: Container(
          width: 280.0,
          height: 280.0,
          decoration: new BoxDecoration(
            color: Color(0xff51c665),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 250.0,
              height: 250.0,
              decoration: new BoxDecoration(
                color: Color(0xff43b656),
                shape: BoxShape.circle,
              ),
              child: IconTheme(
                data: new IconThemeData(color: Color(0xff2d7839)),
                child: new Icon(
                  Icons.check,
                  size: 200,
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}

