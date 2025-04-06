import 'dart:async';
import 'dart:isolate';
import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/services/rest_services/api_service_system_models/failure.dart';
import 'package:eko_assignment/services/rest_services/api_service_system_models/network_exception.dart';
import 'package:eko_assignment/services/rest_services/networks_api_service/apis/chains_api_helper.dart';
import 'package:eko_assignment/services/rest_services/networks_api_service/models/chain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chains_state.dart';

class ChainsCubit extends Cubit<ChainsState> with WidgetsBindingObserver {
  ChainsCubit() : super(const ChainsState()) {
    WidgetsBinding.instance.addObserver(this);
  }

  Isolate? _gamesIsolate;
  ReceivePort? _receivePort;
  Timer? _pollingTimer;
  bool _isAppInBackground = false;

  Future<void> chainsList() async {
    // emit(state.copyWith(isMatchListLoading: true));
    await _getGamesList();
    if (!_isAppInBackground) {
      await _startPolling();
    }
  }

  Future<void> _startPolling() async {
    // emit(state.copyWith(isMatchListLoading: true));
    // Prevent multiple polling timers
    if (_pollingTimer?.isActive ?? false) return;

    Duration interval = const Duration(milliseconds: 7000);
    emit(state.copyWith(isChainsLoading: true));

    _pollingTimer = Timer.periodic(interval, (timer) async {
      if (_isAppInBackground) {
        appLogger.w('App is in background, stopping polling.');
        _pollingTimer?.cancel();
        return;
      }

      appLogger.i('Fetching games list every ${interval.inSeconds} seconds at ${DateTime.now()}');
      final success = await _getGamesListWithResult();
      interval = success ? const Duration(seconds: 7) : const Duration(seconds: 20);

      _pollingTimer?.cancel();
      if (!_isAppInBackground) {
        _pollingTimer = Timer.periodic(interval, (t) => _getGamesListWithResult());
      }
    });
  }

  Future<bool> _getGamesListWithResult() async {
    await _cancelGamesIsolate();
    _receivePort = ReceivePort();

    try {
      emit(state.copyWith(isChainsLoading: true));
      _gamesIsolate = await Isolate.spawn(_getGamesListIsolate, _receivePort!.sendPort);
      final completer = Completer<bool>();

      _receivePort!.listen((result) {
        appLogger.w('Received result: $result');
        if (result is List<Chain>) {
          emit(state.copyWith(isChainsLoading: false, chains: result, errorMessage: ''));
          completer.complete(true);
        } else if (result is String) {
          emit(state.copyWith(isChainsLoading: false, chains: [], errorMessage: 'Error in fetching games list'));
          appLogger.w('Error in fetching games list: $result');
          completer.complete(false);
        }
      });

      return completer.future;
    } catch (e) {
      emit(state.copyWith(isChainsLoading: false, errorMessage: 'Failed to fetch games.'));
      return false;
    }
  }

  Future<void> _getGamesList() async {
    emit(state.copyWith(isChainsLoading: true));
    await _cancelGamesIsolate();
    _receivePort = ReceivePort();
    try {
      _gamesIsolate = await Isolate.spawn(_getGamesListIsolate, _receivePort!.sendPort);
      _receivePort!.listen((result) {
        if (result is List<Chain>) {
          emit(state.copyWith(isChainsLoading: false, chains: result, errorMessage: ''));
        } else if (result is String) {
          emit(state.copyWith(isChainsLoading: false, errorMessage: 'Error in fetching games list...'));
          appLogger.w('Error in fetching games list: $result');
        }
      });
    } catch (e) {
      emit(state.copyWith(isChainsLoading: false, errorMessage: 'Failed to fetch games.'));
    }
  }

  static Future<void> _getGamesListIsolate(SendPort sendPort) async {
    final gamesListResponse = await ChainsApiHelper().chainsList();

    gamesListResponse.fold(
      (failure) {
        final message = NetworkException.getErrorMessage((failure as NetworkFailure).exception);
        sendPort.send(message);
      },
      (response) => sendPort.send(response.chains),
    );
  }

  Future<void> cancelPolling() async {
    _pollingTimer?.cancel();
    await _cancelGamesIsolate();
  }

  Future<void> _cancelGamesIsolate() async {
    _gamesIsolate?.kill(priority: Isolate.immediate);
    _gamesIsolate = null;
    _receivePort?.close();
    _receivePort = null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _isAppInBackground = true;
      cancelPolling();
      appLogger.w('App moved to background, polling stopped.');
    } else if (state == AppLifecycleState.resumed) {
      _isAppInBackground = false;
      if (_pollingTimer == null || !_pollingTimer!.isActive) {
        _startPolling();
      }
      appLogger.i('App moved to foreground, polling resumed.');
    }
  }

  @override
  Future<void> close() async {
    WidgetsBinding.instance.removeObserver(this);
    await cancelPolling();
    await super.close();
  }

  void clearErrorMessage() {
    emit(state.copyWith(errorMessage: null));
  }
}
