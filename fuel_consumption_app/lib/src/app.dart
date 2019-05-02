import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/screens/main_screen.dart';

class FuelConsumptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Consumption',
      home: MainScreen(),
    );
  }
}