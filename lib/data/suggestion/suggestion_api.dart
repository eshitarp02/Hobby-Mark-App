import 'dart:async';

import 'package:to_do_app/domain/model/response/suggestion_response_model.dart';

abstract class SuggestionApi {
  Future<SuggestionResponseModel?> getSuggestions({
    required String userId,
  });
}
