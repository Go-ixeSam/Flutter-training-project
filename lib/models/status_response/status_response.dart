import 'package:json_annotation/json_annotation.dart';
part 'status_response.g.dart';

@JsonSerializable()
class StatusResponse {
  bool? success;

  StatusResponse(this.success);

  factory StatusResponse.formJson(Map<String, dynamic> json) =>
      _$StatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StatusResponseToJson(this);
}
