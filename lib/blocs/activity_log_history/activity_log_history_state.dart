part of 'activity_log_history_bloc.dart';

sealed class ActivityLogHistoryState extends Equatable {
  const ActivityLogHistoryState();
}

final class ActivityLogHistoryInitial extends ActivityLogHistoryState {
  @override
  List<Object> get props => [];
}

final class ActivityLogHistoryOnLoadState extends ActivityLogHistoryState {
  final List<Items>? activityLogList;

  const ActivityLogHistoryOnLoadState({
    this.activityLogList = const [],
  });

  @override
  List<Object?> get props => [
        activityLogList,
      ];
}
