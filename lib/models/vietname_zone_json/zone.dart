import 'package:json_annotation/json_annotation.dart';
part 'zone.g.dart';

@JsonSerializable()
class Zone {
  String? city;
  String? province;
  String? area;
  String? population;

  Zone({
    this.city,
    this.province,
    this.area,
    this.population,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
  Map<String, dynamic> toJson() => _$ZoneToJson(this);
}
