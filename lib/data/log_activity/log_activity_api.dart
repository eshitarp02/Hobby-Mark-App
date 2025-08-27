import 'dart:async';

import 'package:to_do_app/domain/model/request/log_new_activity_request_model.dart';
import 'package:to_do_app/domain/model/response/activity_log_response_model.dart';
import 'package:to_do_app/domain/model/response/log_new_activity_response_model.dart';

abstract class LogActivityApi {
  Future<LogNewActivityResponseModel?> logNewActivity({
    required LogNewActivityRequestModel logNewActivityRequestModel,
  });

  Future<ActivityLogResponseModel?> getActivityLog({
    required String userId,
  });
}
