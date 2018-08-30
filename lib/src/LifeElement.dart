import 'package:flutter/material.dart';

class LifeElement extends StatefulWidget {
  final map;
  
  LifeElement(this.map);

  @override
  State<StatefulWidget> createState() => new _LifeElementState();
}

class _LifeElementState extends State<LifeElement> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        color: const Color(0xFF00FF00),
        width: 48.0,
        height: 48.0,
      ),
    );
  }
}
