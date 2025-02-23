import 'package:eko_assignment/services/rest_services/matches_api_service/models/odds.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';

part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required int? gameId,
    required String? awayTeam,
    required String? homeTeam,
    required Odds? odds,

  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
