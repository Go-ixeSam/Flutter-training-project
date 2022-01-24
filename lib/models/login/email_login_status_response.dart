import 'package:json_annotation/json_annotation.dart';
part 'email_login_status_response.g.dart';

@JsonSerializable()
class EmailLoginStatusResponse {
  String? access_token;
  String? token_type;

  EmailLoginStatusResponse({this.access_token, this.token_type});

  factory EmailLoginStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailLoginStatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EmailLoginStatusResponseToJson(this);
}
