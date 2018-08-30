import 'package:flutter/material.dart';
import 'package:game_of_life/src/Life.dart';

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
        child: Life(),
      ),
    );
  }
}
