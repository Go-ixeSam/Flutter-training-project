import 'zone.dart';
class ZoneList {
  final List<Zone>? zone;

  ZoneList({
    this.zone,
  });

  factory ZoneList.fromJson(List<dynamic> json) {
    List<Zone> zone = <Zone>[];
    zone = json.map((zone) => Zone.fromJson(zone)).toList();
    return ZoneList(
      zone: zone,
    );
  }
}
