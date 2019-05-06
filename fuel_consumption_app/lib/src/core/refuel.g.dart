// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refuel _$RefuelFromJson(Map<String, dynamic> json) {
  return Refuel(
      json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      json['drivenLength'] as int,
      (json['refueledLitres'] as num)?.toDouble());
}

Map<String, dynamic> _$RefuelToJson(Refuel instance) => <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'drivenLength': instance.drivenLength,
      'refueledLitres': instance.refueledLitres
    };
