import 'package:flutter/material.dart';
import 'package:online_croceries/models/vietname_zone_json/vietnam_zone.dart';
import 'package:online_croceries/models/vietname_zone_json/zone.dart';
import 'package:online_croceries/models/vietname_zone_json/zone_list.dart';

class SelectWidget extends StatelessWidget {
  final String? selectContext;
  final ValueChanged? onChange;
  // const SelectWidget({Key? key}) : super(key: key);
  const SelectWidget({this.selectContext, required this.onChange});
  @override
  Widget build(BuildContext context) {
    ZoneList zoneList = ZoneList.fromJson(VietnameZone.Vietname);
    return DropdownButton<String>(
        isExpanded: true,
        value: selectContext,
        onChanged: onChange,
        items: zoneList.zone?.map((Zone e) {
          return DropdownMenuItem<String>(
              value: e.city, child: Text(e.city.toString()));
        }).toList());
  }
}
