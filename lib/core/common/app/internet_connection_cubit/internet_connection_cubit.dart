import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription<InternetStatus>? _subscription;

  InternetConnectionCubit() : super(InternetConnectionInitial()) {
    _initConnection();

    _subscription = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      if (status == InternetStatus.connected) {
        emit(InternetConnectionConnected());
      } else if (status == InternetStatus.disconnected) {
        emit(InternetConnectionDisconnected());
      }
    });
  }

  Future<void> _initConnection() async {
    emit(InternetConnectionLoading());
    try {
      final bool hasInternet = await InternetConnection().hasInternetAccess;
      if (hasInternet) {
        emit(InternetConnectionConnected());
      } else {
        emit(InternetConnectionDisconnected());
      }
    } catch (e) {
      emit(InternetConnectionDisconnected());
    }
  }

  Future<void> retry() async {
    await _initConnection();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
