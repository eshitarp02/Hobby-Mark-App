import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:to_do_app/data/suggestion/suggestion_api.dart';
import 'package:to_do_app/domain/model/response/suggestion_response_model.dart';
import 'package:to_do_app/domain/repositories/suggestions/suggestions_repository.dart';

class SuggestionsRepositoryImpl extends SuggestionsRepository {
  final suggestionsApi = GetIt.I<SuggestionApi>();

  @override
  Future<SuggestionResponseModel?> getSuggestions({
    required String userId,
  }) {
    return suggestionsApi.getSuggestions(
      userId: userId,
    );
  }
}
