// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChainImpl _$$ChainImplFromJson(Map<String, dynamic> json) => _$ChainImpl(
      chain: json['chain'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      priceInUsd: (json['priceInUsd'] as num?)?.toDouble(),
      change: (json['change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ChainImplToJson(_$ChainImpl instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'balance': instance.balance,
      'priceInUsd': instance.priceInUsd,
      'change': instance.change,
    };
