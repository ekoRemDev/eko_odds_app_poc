import 'package:eko_assignment/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    appLogger.i('email $email password $password');
    try {
      final authResponse = email == 'a@a.com' && password == '123456';

      appLogger.i('authResponse $authResponse');

      if (authResponse) {
        emit(
          state.copyWith(
            isLoaderVisible: false,
            isLoggedIn: authResponse,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoaderVisible: false,
            isLoggedIn: authResponse,
            errorMessage: authResponse ? null : 'failed to login',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          isLoaderVisible: false,
          isLoggedIn: false,
        ),
      );
    }
  }

  Future<void> authenticate({
    required LocalAuthentication localAuth,
  }) async {
    appLogger.i('authenticate');
    try {
      final bool authenticated = await localAuth.authenticate(
        localizedReason: 'Login to continue',
        options: const AuthenticationOptions(
          biometricOnly: false,
          useErrorDialogs: false,
          stickyAuth: true,
        ),
      );

      emit(
        state.copyWith(
          isLoggedIn: authenticated,
        ),
      );
    } on PlatformException catch (e) {
      appLogger.e('Authentication error: $e');
    } catch (e) {
      emit(
        state.copyWith(
          isLoggedIn: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> logout() async {}
}
