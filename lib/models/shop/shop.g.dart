// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop(
    json['title'] as String?,
    json['id'] as int?,
    (json['product'] as List<dynamic>)
        .map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'product': instance.product,
    };
