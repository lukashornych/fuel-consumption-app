import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fuel_consumption_app/src/dialogs/add_refuel_dialog.dart';
import 'package:fuel_consumption_app/src/dialogs/clear_all_dialog.dart';
import 'package:fuel_consumption_app/src/core/state_container.dart';
import 'package:fuel_consumption_app/src/theme/theme.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  DateFormat _dateFormat;

  Future<Null> buildDialog(BuildContext context, WidgetBuilder builder) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: builder
    );
  }

  @override
  void initState() {
    _dateFormat = DateFormat('d. MMMM y');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final StateContainerState state = StateContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Icon(Icons.local_gas_station),
          Container(width: FuelConsumptionTheme.defaultPadding,),
          Text('Fuel Consumption'),
        ],),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('Avg. consumption'),
              trailing: Text('${state.repository.refuelsManager.averageConsumption.toStringAsFixed(1)}l/100km'),
            ),
            margin: EdgeInsets.all(FuelConsumptionTheme.defaultPadding),
          ),
          Expanded(child: Card(
            margin: EdgeInsets.all(FuelConsumptionTheme.defaultPadding),
            child: Column(children: <Widget>[
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History of Refuels"),
                trailing: FlatButton.icon(
                  onPressed: () => buildDialog(context, (BuildContext context) => ClearAllDialog()), 
                  icon: Icon(Icons.clear), 
                  label: Text('Clear history')
                ),
              ),
              Expanded(child: ListView.builder(
                  itemCount: state.repository.refuelsManager.refuels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${_dateFormat.format(state.repository.refuelsManager.refuels[index].dateTime)}'),
                      subtitle: Text('Driven length: ${state.repository.refuelsManager.refuels[index].drivenLength} km, ' +
                                    'refueled: ${state.repository.refuelsManager.refuels[index].refueledLitres} l'),
                    );
                  }
              ),),
            ],),
          ),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Add refuel",
          onPressed: () => buildDialog(context, (BuildContext context) => AddRefuelDialog())
      ),
    );
  }
}