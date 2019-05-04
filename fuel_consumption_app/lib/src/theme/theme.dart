import 'package:flutter/material.dart';

class FuelConsumptionTheme {
    static final Color themeColor = Colors.green[600];
    static final Color themeColorLight = Colors.green[400];
    static final Color themeColorDark = Colors.green[900];
    static final Color themeFieldBackgroundColor = Colors.grey[200];
    
    static final double defaultPadding = 15.0;

    static ThemeData get themeData {
        return ThemeData(
            hintColor: themeColor,
            primaryColor: themeColor,
            primaryColorDark: themeColorDark,
            primaryColorLight: themeColorLight,
            accentColor: themeColorLight,
            splashColor: Colors.green[100],
            indicatorColor: Colors.white
        );
    }

    static InputDecoration getInputDecoration(String label, {String suffix, String help}) {
        return InputDecoration(
            filled: true,
            fillColor: themeFieldBackgroundColor,
            labelText: label,
            helperText: help,
            suffixText: suffix
        );
    }
}