// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GamesListImpl _$$GamesListImplFromJson(Map<String, dynamic> json) =>
    _$GamesListImpl(
      games: (json['games'] as List<dynamic>)
          .map((e) => Game.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GamesListImplToJson(_$GamesListImpl instance) =>
    <String, dynamic>{
      'games': instance.games,
    };
