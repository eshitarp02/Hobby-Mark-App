import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/domain/model/response/activity_log_response_model.dart';
import 'package:to_do_app/domain/repositories/auth/auth_repository.dart';
import 'package:to_do_app/domain/repositories/log_activity/log_activity_repository.dart';

part 'activity_log_history_event.dart';

part 'activity_log_history_state.dart';

class ActivityLogHistoryBloc
    extends Bloc<ActivityLogHistoryEvent, ActivityLogHistoryState> {
  final _authRepo = GetIt.I<AuthRepository>();
  final _logActivity = GetIt.I<LogActivityRepository>();

  ActivityLogHistoryBloc() : super(ActivityLogHistoryInitial()) {
    on<ActivityLogHistoryOnLoadEvent>(_onLoadActivityLogHistory);
  }

  FutureOr<void> _onLoadActivityLogHistory(ActivityLogHistoryOnLoadEvent event,
      Emitter<ActivityLogHistoryState> emit) async {
    // get user Id from shared preferences
    final userId = await _authRepo.getProfile();

    final activityLogResponse = await _logActivity.getActivityLog(
      userId: userId ?? '',
    );
    if (activityLogResponse != null &&
        (activityLogResponse.items ?? []).isNotEmpty) {
      emit(
        ActivityLogHistoryOnLoadState(
          activityLogList: activityLogResponse.items,
        ),
      );
    } else {
      emit(
        ActivityLogHistoryOnLoadState(),
      );
    }
  }
}
