// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoy _$FoodCategoyFromJson(Map<String, dynamic> json) {
  return FoodCategoy(
    title: json['title'] as String?,
    id: json['id'] as int?,
    product: (json['product'] as List<dynamic>?)
        ?.map((e) => FoodProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FoodCategoyToJson(FoodCategoy instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'product': instance.product,
    };
