import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:game_of_life/src/LifeElement.dart';
import 'package:game_of_life/src/store.dart';

class Life extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LifeState();
}

class _LifeState extends State<Life> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<GameState, GameState>(
      converter: (store) => store.state,
      builder: (context, store) {
        return new Row(
          children: store.map.keys.map((index) => new LifeElement(store.map[index])).toList(),
        );
      },
    );
  }
}
