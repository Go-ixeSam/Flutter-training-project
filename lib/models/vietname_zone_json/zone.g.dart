// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Zone _$ZoneFromJson(Map<String, dynamic> json) {
  return Zone(
    city: json['city'] as String?,
    province: json['province'] as String?,
    area: json['area'] as String?,
    population: json['population'] as String?,
  );
}

Map<String, dynamic> _$ZoneToJson(Zone instance) => <String, dynamic>{
      'city': instance.city,
      'province': instance.province,
      'area': instance.area,
      'population': instance.population,
    };
