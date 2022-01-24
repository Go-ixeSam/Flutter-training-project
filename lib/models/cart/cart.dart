import 'package:json_annotation/json_annotation.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  int? id;
  String? name;
  double? price;
  String? image;
  int? nutrition;
  int? review;
  String? detail;

  Cart(this.id, this.name, this.price, this.image, this.nutrition, this.review,
      this.detail);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
