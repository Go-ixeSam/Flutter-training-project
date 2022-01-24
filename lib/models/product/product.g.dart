// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    nutrition: json['nutrition'] as int?,
    review: json['review'] as int?,
    detail: json['detail'] as String?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'nutrition': instance.nutrition,
      'review': instance.review,
      'detail': instance.detail,
    };
