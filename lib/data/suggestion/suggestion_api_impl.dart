import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/utils/app_config.dart';
import 'package:to_do_app/domain/model/response/suggestion_response_model.dart';
import 'package:to_do_app/domain/repositories/auth/auth_repository.dart';
import 'package:to_do_app/infrastructure/network/api_client.dart';
import 'package:to_do_app/infrastructure/network/api_endpoints.dart';
import 'package:to_do_app/infrastructure/network/network_exception.dart';
import 'package:to_do_app/infrastructure/network/repository_exception.dart';

import 'suggestion_api.dart';

class SuggestionApiImpl extends SuggestionApi {
  final apiClient = GetIt.I<ApiClient>();

  AppConfig get _appConfig => GetIt.I<AppConfig>();
  final AuthRepository authRepository = GetIt.I<AuthRepository>();

  @override
  Future<SuggestionResponseModel?> getSuggestions({
    required String userId,
  }) async {
    try {
      final SuggestionResponseModel suggestionResponseModel;
      final response = await apiClient.get(
        '${_appConfig.baseUrl}${ApiEndPoints.suggestionList}?userId=$userId',
        options: Options(
          method: 'GET',
        ),
      );
      suggestionResponseModel = SuggestionResponseModel.fromJson(
        response?.data,
      );
      return suggestionResponseModel;
    } on NetworkException catch (e) {
      throw RepositoryException(e.message);
    }
  }
}
