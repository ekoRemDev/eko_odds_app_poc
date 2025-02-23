import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenState());

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  void toggleEmailValid(bool isValid) {
    emit(state.copyWith(isMailValid: isValid));
  }

  void togglePasswordValid(bool isValid) {
    emit(state.copyWith(isPasswordValid: isValid));
  }

  void emitEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void emitPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void reset() {
    emit(
      state.copyWith(
        email: '',
        password: '',
        isMailValid: false,
        isPasswordValid: false,
      ),
    );
  }
}
