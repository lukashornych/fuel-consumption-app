// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuels_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefuelsManager _$RefuelsManagerFromJson(Map<String, dynamic> json) {
  return RefuelsManager()
    ..refuels = (json['refuels'] as List)
        ?.map((e) =>
            e == null ? null : Refuel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RefuelsManagerToJson(RefuelsManager instance) =>
    <String, dynamic>{'refuels': instance.refuels};
