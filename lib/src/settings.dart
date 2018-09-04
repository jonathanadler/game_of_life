import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:game_of_life/src/store.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingsState();
  }
}

class SettingsConnectedData {
  Function callback;
  bool isPlaying;

  SettingsConnectedData(this.isPlaying, this.callback);
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<GameState, SettingsConnectedData>(
      converter: (store) {
        return new SettingsConnectedData(store.state.isPlaying, (Actions action) {
          VoidCallback callAction () {
            store.dispatch(new Action(action));
          }
          return callAction;
        });
      },
      builder: (context, connectedData) {
        bool isPlaying = connectedData.isPlaying;
        IconData icon = isPlaying == true ? Icons.stop : Icons.play_arrow;

        return new Container(
          height: 80.0,
          child: new FloatingActionButton(
              child: Icon(icon), 
              onPressed: () {
                if (isPlaying == true) {
                  connectedData.callback(Actions.STOP)();
                } else {
                  connectedData.callback(Actions.START)();
                }
              }
          )
        );
      },
    );
  }
}
