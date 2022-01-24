import 'package:json_annotation/json_annotation.dart';
part 'phone_login_status_response.g.dart';

@JsonSerializable()
class PhoneStatusResponse{
  String? success;

  PhoneStatusResponse(
      {
        this.success,
      });

  factory PhoneStatusResponse.fromJson(Map<String, dynamic> json) => _$PhoneStatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneStatusResponseToJson(this);
}