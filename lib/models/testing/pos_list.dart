import 'package:online_croceries/models/shop/shop.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';

class PosList {
  final List<Pos>? shops;
  PosList({this.shops});

  factory PosList.fromJson(List<dynamic> json) {
    List<Pos> shops = <Pos>[];
    shops = json.map((shop) => Pos.fromJson(shop)).toList();
    return PosList(
      shops: shops,
    );
  }
}
