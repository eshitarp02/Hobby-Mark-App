import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/activity_log_history/activity_log_history_bloc.dart';
import 'package:to_do_app/presentation/views/activity_log_history/activity_log_history_view.dart';

class ActivityLogHistoryPage extends StatelessWidget {
  const ActivityLogHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActivityLogHistoryBloc>(
      create: (context) => ActivityLogHistoryBloc()
        ..add(
          const ActivityLogHistoryOnLoadEvent(),
        ),
      child: const ActivityLogHistoryView(),
    );
  }
}
