// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodProduct _$FoodProductFromJson(Map<String, dynamic> json) {
  return FoodProduct(
    id: json['id'] as int?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    image: json['image'] as String?,
    nutrition: json['nutrition'] as int?,
    review: json['review'] as int?,
    detail: json['detail'] as String?,
  );
}

Map<String, dynamic> _$FoodProductToJson(FoodProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'nutrition': instance.nutrition,
      'review': instance.review,
      'detail': instance.detail,
    };
