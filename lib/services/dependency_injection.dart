import 'package:eko_assignment/screens/chains_screen/chains_cubit/chains_cubit.dart';
import 'package:eko_assignment/screens/games_screen/games_cubit/games_cubit.dart';
import 'package:eko_assignment/screens/login_screen/cubit/auth_cubit/auth_cubit.dart';
import 'package:eko_assignment/screens/login_screen/cubit/login_screen_cubit/login_screen_cubit.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> setupDependencyInjection() async {
  di
    ..registerSingleton<LoginScreenCubit>(LoginScreenCubit())
    ..registerSingleton<GamesCubit>(GamesCubit())
    ..registerSingleton<ChainsCubit>(ChainsCubit())
    ..registerSingleton<AuthCubit>(AuthCubit());
}
