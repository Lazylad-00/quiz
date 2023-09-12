import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
part 'connectivity_event.dart';
part 'connectivity_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  MainBloc() : super(CheckAnswerInitial()) {
    on<ConnectivityLostEvent>((event, emit) => emit(ConnectivityLostState()));

    on<ConnectivityGainedEvent>(
        (event, emit) => emit(ConnectivityGainedState()));

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(ConnectivityGainedEvent());
      } else {
        add(ConnectivityLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
