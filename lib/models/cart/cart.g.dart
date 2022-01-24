// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    json['id'] as int?,
    json['name'] as String?,
    (json['price'] as num?)?.toDouble(),
    json['image'] as String?,
    json['nutrition'] as int?,
    json['review'] as int?,
    json['detail'] as String?,
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'nutrition': instance.nutrition,
      'review': instance.review,
      'detail': instance.detail,
    };
