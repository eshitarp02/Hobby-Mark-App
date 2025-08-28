part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeOnLoadEvent extends HomeEvent {
  const HomeOnLoadEvent();
}

class GetActivityLogListEvent extends HomeEvent {
  const GetActivityLogListEvent();
}

class NextActivityEvent extends HomeEvent {
  const NextActivityEvent();
}

class PreviousActivityEvent extends HomeEvent {
  const PreviousActivityEvent();
}
