import 'dart:async';

import 'package:redux/redux.dart';

enum Actions {
  STEP,
  NEGATE_ELEMENT,
  START,
  STOP,
}
class Action {
  Actions type;
  Map<String, dynamic> payload;
  
  Action(this.type, [this.payload]);
}

class GameState {
  final map = {};
  int size = 10;

  GameState() {
    for (int i = 0; i < size; i++) {
      map[i] = {};

      for(int j = 0; j < size; j++) {
        map[i][j] = false;
      }
    }
  }

  GameState.fromSize(int size) {
    this.size = size;
    for (int i = 0; i < size; i++) {
      map[i] = {};

      for(int j = 0; j < size; j++) {
        map[i][j] = false;
      }
    }
  }

  GameState.fromOther(GameState other) {
    this.size = other.size;

    for (int i = 0; i < size; i++) {
      map[i] = {};

      for(int j = 0; j < size; j++) {
        map[i][j] = other.map[i][j];
      }
    }
  }
}

var gameTimer;
  
GameState gameReducer(GameState state, dynamic action) {
  Actions type = action.type;
  Map<String, dynamic> payload = action.payload;

  if (type == Actions.NEGATE_ELEMENT) {
    int i = payload['i'];
    int j = payload['j'];
    state.map[i][j] = !state.map[i][j];
  }

  return GameState.fromOther(state);
}

gameMiddleware(Store<GameState> store, action, NextDispatcher next) {
  Actions type = action.type;
  Map<String, dynamic> payload = action.payload;

  if (type == Actions.START) {
    Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      print('adler hererererere!!!!!!!!!!!!!!!!!!!!!!!!');
      store.dispatch(new Action(Actions.STEP));
      gameTimer = timer;
    });
  } else if (type == Actions.STOP) {
    gameTimer.cancel();
  }

  next(action);
}