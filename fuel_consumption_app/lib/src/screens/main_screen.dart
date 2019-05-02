import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fuel_consumption_app/src/core/repository.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {

  Repository _repository;
  DateFormat _dateFormat;

  @override
  void initState() {
    _repository = Repository();
    _dateFormat = DateFormat('d. MMMM y');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Icon(Icons.local_gas_station),
          Container(width: 10.0,),
          Text('Fuel Consumption')
        ],),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('Avg. consumption'),
              trailing: Text('${_repository.refuelsManager.averageConsumption.toStringAsFixed(1)}l/100km'),
            ),
            margin: EdgeInsets.all(10.0),
          ),
          Expanded(child: Card(
            margin: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History of refuels"),
                trailing: FlatButton.icon(onPressed: null, icon: Icon(Icons.clear), label: Text('Clear history')),
              ),
              Expanded(child: ListView.builder(
                  itemCount: _repository.refuelsManager.refuels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${_dateFormat.format(_repository.refuelsManager.refuels[index].dateTime)}'),
                      subtitle: Text('Driven length: ${_repository.refuelsManager.refuels[index].drivenLength} km, refueled: ${_repository.refuelsManager.refuels[index].refueledLitres} l'),
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
          onPressed: null
      ),
    );
  }
}