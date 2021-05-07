import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News Route'),
        ),
        body: Container(
          margin: EdgeInsets.all(100),
          color: Colors.redAccent,
          child: Text('MY NEWS', style: TextStyle(color: Colors.black, fontSize: 30.0),),
        )
    );
  }
}
