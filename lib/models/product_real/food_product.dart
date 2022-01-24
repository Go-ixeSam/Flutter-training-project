import 'package:json_annotation/json_annotation.dart';
part 'food_product.g.dart';

@JsonSerializable()
class FoodProduct {
  int? id;
  String? name;
  double? price;
  String? image;
  int? nutrition;
  int? review;
  String? detail;


  FoodProduct({
    this.id, this.name,

    this.price

    , this.image, this.nutrition,
    this.review, this.detail
});

  factory FoodProduct.fromJson(Map<String, dynamic> json) =>
      _$FoodProductFromJson(json);
  Map<String, dynamic> toJson() => _$FoodProductToJson(this);
}
