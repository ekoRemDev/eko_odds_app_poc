part of 'auth_cubit.dart';

class AuthState {
  const AuthState({
    this.isLoaderVisible,
    this.errorMessage,
    this.isLoggedIn,
  });

  final bool? isLoaderVisible;
  final String? errorMessage;
  final bool? isLoggedIn;

  AuthState copyWith({
    bool? isLoaderVisible,
    String? errorMessage,
    bool? isLoggedIn,
  }) =>
      AuthState(
        isLoaderVisible: isLoaderVisible ?? this.isLoaderVisible,
        errorMessage: errorMessage ?? this.errorMessage,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );
}
