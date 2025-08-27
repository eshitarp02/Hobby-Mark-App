part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeOnLoadState extends HomeState {
  final List<Suggestions>? suggestionsList;
  final bool isActivityLogListLoadingInProgress;
  final bool isActivityLogPopUps;
  final int currentActivityIndex;

  const HomeOnLoadState({
    this.suggestionsList = const [],
    this.isActivityLogListLoadingInProgress = false,
    this.isActivityLogPopUps = false,
    this.currentActivityIndex = 0,
  });

  @override
  List<Object?> get props => [
        suggestionsList,
        isActivityLogListLoadingInProgress,
        isActivityLogPopUps,
        currentActivityIndex,
      ];

  HomeOnLoadState copyWith({
    List<Suggestions>? suggestionsList,
    bool? isActivityLogListLoadingInProgress,
    bool? isActivityLogPopUps,
    int? currentActivityIndex,
  }) {
    return HomeOnLoadState(
      suggestionsList: suggestionsList ?? this.suggestionsList,
      isActivityLogListLoadingInProgress: isActivityLogListLoadingInProgress ??
          this.isActivityLogListLoadingInProgress,
      isActivityLogPopUps: isActivityLogPopUps ?? false,
      currentActivityIndex: currentActivityIndex ?? this.currentActivityIndex,
    );
  }
}
