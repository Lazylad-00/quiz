part of 'connectivitybloc.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class CheckAnswerInitial extends MainState {}

class ConnectivityLostState extends MainState {}

class ConnectivityGainedState extends MainState {}
