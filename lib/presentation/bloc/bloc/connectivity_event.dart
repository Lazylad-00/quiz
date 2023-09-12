part of 'connectivitybloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ConnectivityLostEvent extends MainEvent {}

class ConnectivityGainedEvent extends MainEvent {}
