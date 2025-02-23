import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorModel {
  ErrorModel(
    this.type,
    this.detail,
  );

  factory ErrorModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return ErrorModel('unknown', [
        ErrorDetailModel('Unknown error, please try again'),
      ]);
    }
    return _$ErrorModelFromJson(json);
  }

  @JsonKey(defaultValue: 'unknown')
  String? type;
  List<ErrorDetailModel>? detail;

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  @override
  String toString() => 'type: $type, detail: $detail';
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorDetailModel {
  ErrorDetailModel(
    this.msg,
  );

  factory ErrorDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailModelFromJson(json);

  String? msg;

  Map<String, dynamic> toJson() => _$ErrorDetailModelToJson(this);

  @override
  String toString() => 'msg: $msg';
}
