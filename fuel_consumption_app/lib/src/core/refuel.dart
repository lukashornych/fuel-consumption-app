import 'package:json_annotation/json_annotation.dart';

part 'refuel.g.dart';

@JsonSerializable()

class Refuel extends Object {
  DateTime dateTime;
  int drivenLength;
  double refueledLitres;

  Refuel(this.dateTime, this.drivenLength, this.refueledLitres);

  factory Refuel.fromJson(Map<String, dynamic> json) => _$RefuelFromJson(json);

   Map<String, dynamic> toJson() => _$RefuelToJson(this);
}
