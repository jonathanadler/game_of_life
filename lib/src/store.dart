enum Actions {
  STEP,
  NEGATE_ELEMENT,
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

  GameState.fromOther(GameState state) : this.fromSize(state.size);
}
  
GameState gameReducer(GameState state, dynamic action) {
    return GameState.fromOther(state);
}