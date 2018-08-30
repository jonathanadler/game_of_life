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
    return new StoreConnector<GameState, Map>(
      converter: (store) => store.state.map,
      builder: (context, map) {
        return new Row(
          children: map.keys.map<Widget>((index) => new Column(
            children: map[index].keys.map<Widget>((jIndex) => new LifeElement(index, jIndex)).toList(),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          )).toList(),
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
