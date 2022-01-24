import 'package:json_annotation/json_annotation.dart';
import 'package:online_croceries/models/product/product.dart';
part 'shop.g.dart';

@JsonSerializable()
class Shop {
  String? title;
  int? id;
  List<Product?> product;

  Shop(this.title, this.id, this.product);

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
