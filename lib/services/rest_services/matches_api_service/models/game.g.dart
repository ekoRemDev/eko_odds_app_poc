// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      gameId: (json['gameId'] as num?)?.toInt(),
      awayTeam: json['awayTeam'] as String?,
      homeTeam: json['homeTeam'] as String?,
      odds: json['odds'] == null
          ? null
          : Odds.fromJson(json['odds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'awayTeam': instance.awayTeam,
      'homeTeam': instance.homeTeam,
      'odds': instance.odds,
    };
