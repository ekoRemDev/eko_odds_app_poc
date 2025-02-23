part of 'login_screen_cubit.dart';

class LoginScreenState {
  LoginScreenState({
    this.isPasswordObscured = true,
    this.isMailValid = false,
    this.isPasswordValid = false,
    this.email,
    this.password,
  });

  final bool isPasswordObscured;
  final bool? isMailValid;
  final bool? isPasswordValid;
  final String? email;
  final String? password;

  LoginScreenState copyWith({
    bool? isPasswordObscured,
    bool? isMailValid,
    bool? isPasswordValid,
    String? email,
    String? password,
  }) =>
      LoginScreenState(
        isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
        isMailValid: isMailValid ?? this.isMailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
