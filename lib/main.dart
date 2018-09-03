import 'package:flutter/material.dart';
import 'package:game_of_life/src/home.dart';
import 'package:game_of_life/src/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() { 
  final store = new Store<GameState>(gameReducer, initialState: new GameState(), middleware: [gameMiddleware]);
  
  runApp(new MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<GameState> store;
  
  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<GameState> (
      store: this.store,
      child: new MaterialApp(
         title: 'Game of Life',
         home: new HomePage(),
      ),
    );
  }
}
