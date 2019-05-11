import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';

import 'package:fuel_consumption_app/src/core/refuel.dart';

part 'refuels_manager.g.dart';

@JsonSerializable()

class RefuelsManager extends Object {
  static const String _saveFilePath = 'refuels_manager_data.json';

  List<Refuel> refuels;

  RefuelsManager() {
    refuels = [];
  }

  double get averageConsumption {
    double refueledSum = 0;
    double drivenSum = 0;

    for (int i = 0; i < refuels.length; i++) {
      if (i < (refuels.length - 1)) refueledSum += refuels[i].refueledLitres;
      drivenSum += refuels[i].drivenLength;
    }

    return refueledSum / drivenSum * 100.0;
  }

  double consumptionOfSingleRefuel(int index) {
    if (index == 0) return 0;

    double refueled = refuels[index - 1].refueledLitres;
    int driven = refuels[index].drivenLength;

    return refueled / driven * 100.0;
  }

  static Future<File> _getLocalSaveFile() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/$_saveFilePath');

    return file;
  }

  Future<File> saveToLocalStorage() async {
    File file = await _getLocalSaveFile();

    String encodedData = json.encode(this);
    return file.writeAsString(encodedData);
  }

  static Future<RefuelsManager> loadFromLocalStorage() async {
    try {
      File file = await _getLocalSaveFile();
      String content = await file.readAsString();

      Map<String, dynamic> map = json.decode(content);
      return RefuelsManager.fromJson(map);
    } catch (e) {
      return RefuelsManager();
    }
  }

  factory RefuelsManager.fromJson(Map<String, dynamic> json) => _$RefuelsManagerFromJson(json);

  Map<String, dynamic> toJson() => _$RefuelsManagerToJson(this);
}
