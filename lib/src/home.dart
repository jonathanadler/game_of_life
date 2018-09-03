import 'package:flutter/material.dart';
import 'package:game_of_life/src/Life.dart';
import 'package:game_of_life/src/settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game of Life')),
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(child: new Life()),
            new Settings(),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
