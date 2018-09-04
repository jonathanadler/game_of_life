import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:game_of_life/src/store.dart';
import 'package:redux/redux.dart';

class LifeElement extends StatelessWidget {
  final int index;
  final int jIndex;

  LifeElement(this.index, this.jIndex);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<GameState, Store<GameState>>(
      converter: (store) => store,
      builder: (context, store) {
        var state = store.state;
        var onTap = (dragStartDetails) => store.dispatch(new Action(Actions.NEGATE_ELEMENT, {'i': this.index, 'j': this.jIndex}));
        var darkColor = Colors.black;
        var lightColor = Colors.white;
        var color = state.map[this.index][this.jIndex] == true ? darkColor : lightColor;
        var borderSide = new BorderSide(color: darkColor);
        var rightBorder = new BorderSide(color: this.index == state.size - 1 ? darkColor : lightColor);
        var bottomBorder = new BorderSide(color: this.jIndex == state.size - 1 ? darkColor : lightColor);

        return new GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanStart: onTap,
          child: new Container(
            width: 24.0,
            height: 24.0,
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            decoration: new BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              border: new Border(
                top: borderSide,
                left: borderSide,
                bottom: bottomBorder,
                right: rightBorder
              )
            ),
          ),
        );
      },
    );
  }
}
