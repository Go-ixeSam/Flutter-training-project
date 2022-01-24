// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneStatusResponse _$PhoneStatusResponseFromJson(Map<String, dynamic> json) {
  return PhoneStatusResponse(
    success: json['success'] as String?,
  );
}

Map<String, dynamic> _$PhoneStatusResponseToJson(
        PhoneStatusResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
    };
