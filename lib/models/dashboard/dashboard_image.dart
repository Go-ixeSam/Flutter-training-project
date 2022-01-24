import 'package:json_annotation/json_annotation.dart';
part 'dashboard_image.g.dart';

@JsonSerializable()
class DashboardImage {
  String? list;
  DashboardImage(this.list);
  factory DashboardImage.fromJson(Map<String, dynamic> json) =>
      _$DashboardImageFromJson(json);
}
