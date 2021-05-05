import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Home Route'),
        ),
        body: Container(
          height: 200.0,
          width: 200.0,
          margin: EdgeInsets.all(100),
          color: Colors.redAccent,
          child: Center(child: Text('HOME', style: TextStyle(color: Colors.black, fontSize: 30.0),)),
        )
    );
  }
}

