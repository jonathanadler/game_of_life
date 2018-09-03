import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:game_of_life/src/store.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingsState();
  }
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<GameState, VoidCallback>(
      converter: (store) => () {
        store.dispatch(new Action(Actions.START));
      },
      builder: (context, onPress) {
        return new Container(
          height: 80.0,
          child: new FloatingActionButton(
              child: Icon(Icons.play_arrow), onPressed: () {
                onPress();
              }
          )
        );
      },
    );
  }
}
