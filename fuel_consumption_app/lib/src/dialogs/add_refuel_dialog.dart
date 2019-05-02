import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/core/state_container.dart';

class AddRefuelDialog extends StatefulWidget {
  @override
  _AddRefuelDialogState createState() {
    return _AddRefuelDialogState();
  }
}

class _AddRefuelDialogState extends State<AddRefuelDialog> {

  TextEditingController drivenLengthText;
  TextEditingController refueledText;

  @override
  void initState() {
    drivenLengthText = TextEditingController();
    refueledText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final StateContainerState state = StateContainer.of(context);

    return AlertDialog(
      title: Text('Add Refuel'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(controller: drivenLengthText, keyboardType: TextInputType.number,),
          Container(height: 10.0,),
          TextField(controller: refueledText, keyboardType: TextInputType.number,),
      ],),
      actions: <Widget>[
        FlatButton(
          child: Text('ADD'),
          onPressed: () {
            state.addRefuel(int.parse(drivenLengthText.text), double.parse(refueledText.text));
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}