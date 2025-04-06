import 'package:freezed_annotation/freezed_annotation.dart';

part 'chain.freezed.dart';

part 'chain.g.dart';

@freezed
class Chain with _$Chain {
  const factory Chain({
    required String? chain,
    required double? balance,
    required double? priceInUsd,
    required double? change,

  }) = _Chain;

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);
}
