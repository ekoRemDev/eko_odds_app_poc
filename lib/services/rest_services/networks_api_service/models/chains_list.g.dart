// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chains_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChainsListImpl _$$ChainsListImplFromJson(Map<String, dynamic> json) =>
    _$ChainsListImpl(
      chains: (json['chains'] as List<dynamic>)
          .map((e) => Chain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChainsListImplToJson(_$ChainsListImpl instance) =>
    <String, dynamic>{
      'chains': instance.chains,
    };
