import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/core/state_container.dart';
import 'package:fuel_consumption_app/src/theme/theme.dart';

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
          TextField(
            decoration: FuelConsumptionTheme.getInputDecoration('Driven length (km)'), 
            controller: drivenLengthText, 
            keyboardType: TextInputType.number,
          ),
          Container(height: FuelConsumptionTheme.defaultPadding,),
          TextField(
            decoration: FuelConsumptionTheme.getInputDecoration('Refueled (litres)'),
            controller: refueledText, 
            keyboardType: TextInputType.number,
          ),
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