part of 'activity_log_history_bloc.dart';

sealed class ActivityLogHistoryEvent extends Equatable {
  const ActivityLogHistoryEvent();

  @override
  List<Object?> get props => [];
}

class ActivityLogHistoryOnLoadEvent extends ActivityLogHistoryEvent {
  const ActivityLogHistoryOnLoadEvent();
}
