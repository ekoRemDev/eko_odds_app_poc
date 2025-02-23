import 'package:json_annotation/json_annotation.dart';

part 'error_short_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorShortModel {
  ErrorShortModel(
    this.detail,
  );

  factory ErrorShortModel.fromJson(Map<String, dynamic> json) => _$ErrorShortModelFromJson(json);

  String? detail;

  Map<String, dynamic> toJson() => _$ErrorShortModelToJson(this);
}
