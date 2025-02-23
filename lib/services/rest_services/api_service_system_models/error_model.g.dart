// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      json['type'] as String? ?? 'unknown',
      (json['detail'] as List<dynamic>?)
          ?.map((e) => ErrorDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'detail': instance.detail,
    };

ErrorDetailModel _$ErrorDetailModelFromJson(Map<String, dynamic> json) =>
    ErrorDetailModel(
      json['msg'] as String?,
    );

Map<String, dynamic> _$ErrorDetailModelToJson(ErrorDetailModel instance) =>
    <String, dynamic>{
      'msg': instance.msg,
    };
