import 'package:fuel_consumption_app/src/core/refuel.dart';

class RefuelsManager extends Object {
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
}
