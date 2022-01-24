// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_login_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailLoginStatusResponse _$EmailLoginStatusResponseFromJson(
    Map<String, dynamic> json) {
  return EmailLoginStatusResponse(
    access_token: json['access_token'] as String?,
    token_type: json['token_type'] as String?,
  );
}

Map<String, dynamic> _$EmailLoginStatusResponseToJson(
        EmailLoginStatusResponse instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
    };
