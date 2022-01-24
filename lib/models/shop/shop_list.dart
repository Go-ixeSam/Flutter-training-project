import 'package:online_croceries/models/shop/shop.dart';

class ShopList {
  final List<Shop>? shops;
  ShopList({this.shops});

  factory ShopList.fromJson(List<dynamic> json) {
    List<Shop> shops = <Shop>[];
    shops = json.map((shop) => Shop.fromJson(shop)).toList();
    return ShopList(
      shops: shops,
    );
  }
}
