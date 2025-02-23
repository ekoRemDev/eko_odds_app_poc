import 'package:freezed_annotation/freezed_annotation.dart';

part 'odds.freezed.dart';

part 'odds.g.dart';

@freezed
class Odds with _$Odds {
  factory Odds({
    @JsonKey(name: '1') required double homeWin,
    @JsonKey(name: 'X') required double draw,
    @JsonKey(name: '2') required double awayWin,
  }) = _Odds;

  factory Odds.fromJson(Map<String, dynamic> json) => _$OddsFromJson(json);
}
