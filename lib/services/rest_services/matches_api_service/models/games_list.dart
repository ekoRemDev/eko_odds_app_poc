import 'package:eko_assignment/services/rest_services/matches_api_service/models/game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'games_list.freezed.dart';

part 'games_list.g.dart';

@freezed
class GamesList with _$GamesList {
  const factory GamesList({
    required List<Game> games,
  }) = _GamesList;

  factory GamesList.fromJson(Map<String, dynamic> json) => _$GamesListFromJson(json);
}
