import 'package:fuel_consumption_app/src/core/refuel.dart';

class RefuelsManager extends Object {
  List<Refuel> refuels;

  RefuelsManager() {
    refuels = [];
  }

  double get averageConsumption {
    double refueledSum = 0;
    double drivenSum = 0;

    refuels.forEach((refuel) {
      refueledSum += refuel.refueledLitres;
      drivenSum += refuel.drivenLength;
    });

    return refueledSum / drivenSum * 100.0;
  }
}
