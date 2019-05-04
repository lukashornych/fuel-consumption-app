import 'package:flutter/material.dart';

import 'package:fuel_consumption_app/src/screens/main_screen.dart';
import 'package:fuel_consumption_app/src/theme/theme.dart';

class FuelConsumptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Consumption',
      home: MainScreen(),
      theme: FuelConsumptionTheme.themeData,
    );
  }
}