import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/core/state_container.dart';

class ClearAllDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StateContainerState state = StateContainer.of(context);

    return AlertDialog(
      title: Text('Clear All'),
      content: Text('Do you want to clear all refuels from history and reset average consumption?'),
      actions: <Widget>[
        FlatButton(
          child: Text('CLEAR'),
          onPressed: () {
            state.clearAll();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}