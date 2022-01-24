import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? image;
  double? price;
  int? nutrition;
  int? review;
  String? detail;

  Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.nutrition,
    this.review,
    this.detail,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
