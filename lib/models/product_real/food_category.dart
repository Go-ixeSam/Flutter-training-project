import 'package:json_annotation/json_annotation.dart';
import 'package:online_croceries/models/product_real/food_product.dart';

part 'food_category.g.dart';

@JsonSerializable()
class FoodCategoy{
  String? title;
  int? id;
  List<FoodProduct>? product;

  FoodCategoy({this.title, this.id, this.product});

  factory FoodCategoy.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoyFromJson(json);
  Map<String, dynamic> toJson() => _$FoodCategoyToJson(this);
}