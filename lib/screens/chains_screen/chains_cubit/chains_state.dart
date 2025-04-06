part of 'chains_cubit.dart';

class ChainsState {
  const ChainsState({
    this.errorMessage,
    this.isChainsLoading = false,
    this.chains,
  });

  final String? errorMessage;
  final bool isChainsLoading;
  final List<Chain>? chains;

  ChainsState copyWith({
    String? errorMessage,
    bool? isChainsLoading,
    List<Chain>? chains,
  }) =>
      ChainsState(
        errorMessage: errorMessage ?? this.errorMessage,
        isChainsLoading: isChainsLoading ?? this.isChainsLoading,
        chains: chains ?? this.chains,
      );
}
