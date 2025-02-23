// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OddsImpl _$$OddsImplFromJson(Map<String, dynamic> json) => _$OddsImpl(
      homeWin: (json['1'] as num).toDouble(),
      draw: (json['X'] as num).toDouble(),
      awayWin: (json['2'] as num).toDouble(),
    );

Map<String, dynamic> _$$OddsImplToJson(_$OddsImpl instance) =>
    <String, dynamic>{
      '1': instance.homeWin,
      'X': instance.draw,
      '2': instance.awayWin,
    };
