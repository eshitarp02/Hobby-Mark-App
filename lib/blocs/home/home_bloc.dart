import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/domain/model/response/suggestion_response_model.dart';
import 'package:to_do_app/domain/repositories/auth/auth_repository.dart';
import 'package:to_do_app/domain/repositories/suggestions/suggestions_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _authRepo = GetIt.I<AuthRepository>();
  final _suggestionsRepo = GetIt.I<SuggestionsRepository>();

  HomeBloc() : super(HomeInitial()) {
    on<HomeOnLoadEvent>(_onLoadHome);
    on<GetActivityLogListEvent>(_onGetActivityLogList);
    on<NextActivityEvent>(_onNextActivity);
    on<PreviousActivityEvent>(_onPreviousActivity);
  }

  FutureOr<void> _onLoadHome(
      HomeOnLoadEvent event, Emitter<HomeState> emit) async {
    emit(
      HomeOnLoadState(),
    );
  }

  FutureOr<void> _onGetActivityLogList(
      GetActivityLogListEvent event, Emitter<HomeState> emit) async {
    final castState = state as HomeOnLoadState;

    // show circular progress indicator
    emit(
      castState.copyWith(
        currentActivityIndex: 0,
        isActivityLogListLoadingInProgress: true,
      ),
    );

    // get user Id from shared preferences
    final userId = await _authRepo.getProfile();

    final suggestionsResponse = await _suggestionsRepo.getSuggestions(
      userId: userId ?? '',
    );
    if (suggestionsResponse != null &&
        (suggestionsResponse.suggestions ?? []).isNotEmpty) {
      emit(
        castState.copyWith(
          currentActivityIndex: 0,
          isActivityLogListLoadingInProgress: false,
          suggestionsList: suggestionsResponse.suggestions,
          isActivityLogPopUps: true,
        ),
      );
    } else {
      emit(
        castState.copyWith(
          currentActivityIndex: 0,
          isActivityLogListLoadingInProgress: false,
          suggestionsList: [],
          isActivityLogPopUps: true,
        ),
      );
    }
  }

  FutureOr<void> _onNextActivity(
      NextActivityEvent event, Emitter<HomeState> emit) {
    final castState = state as HomeOnLoadState;

    emit(
      castState.copyWith(
        currentActivityIndex: castState.currentActivityIndex + 1,
        isActivityLogPopUps: true,
      ),
    );
  }

  FutureOr<void> _onPreviousActivity(
      PreviousActivityEvent event, Emitter<HomeState> emit) {
    final castState = state as HomeOnLoadState;

    emit(
      castState.copyWith(
        currentActivityIndex: castState.currentActivityIndex - 1,
        isActivityLogPopUps: true,
      ),
    );
  }
}
