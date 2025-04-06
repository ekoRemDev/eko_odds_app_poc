import 'package:eko_assignment/services/rest_services/networks_api_service/models/chain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chains_list.freezed.dart';

part 'chains_list.g.dart';

@freezed
class ChainsList with _$ChainsList {
  const factory ChainsList({
    required List<Chain> chains,
  }) = _ChainsList;

  factory ChainsList.fromJson(Map<String, dynamic> json) => _$ChainsListFromJson(json);
}
