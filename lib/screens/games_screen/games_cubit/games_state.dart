part of 'games_cubit.dart';

class GamesState {
  const GamesState({
    this.errorMessage,
    this.isMatchListLoading = false,
    this.games,
  });

  final String? errorMessage;
  final bool isMatchListLoading;
  final List<Game>? games;

  GamesState copyWith({
    String? errorMessage,
    bool? isMatchListLoading,
    List<Game>? games,
  }) =>
      GamesState(
        errorMessage: errorMessage ?? this.errorMessage,
        isMatchListLoading: isMatchListLoading ?? this.isMatchListLoading,
        games: games ?? this.games,
      );
}
