import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/activity_log_history/activity_log_history_bloc.dart';
import 'package:to_do_app/core/consts/asset_images.dart';
import 'package:to_do_app/core/utils/string_extension.dart';
import 'package:to_do_app/presentation/widgets/components/stroke_text_field.dart';

class ActivityLogHistoryView extends StatelessWidget {
  const ActivityLogHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityLogHistoryBloc, ActivityLogHistoryState>(
      builder: (context, state) {
        if (state is ActivityLogHistoryOnLoadState) {
          return Column(
            children: [
              Container(
                color: Color(0XFF7B38B1),
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).maybePop();
                        },
                        child: Image.asset(
                          AssetPNGImages.back,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0XFFB090D8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      50.0,
                    ),
                    bottomRight: Radius.circular(
                      50.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StrokeTextField(
                      text: 'Activity Logs',
                      strokeColor: Color(0XFF251CAE),
                      strokeWidth: 4.0,
                      textColor: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0XFF95CCE8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        50.0,
                      ),
                      topRight: Radius.circular(
                        50.0,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      if ((state.activityLogList ?? []).isNotEmpty)
                        Flexible(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 20.0,
                            ),
                            itemCount: (state.activityLogList ?? []).length,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (
                              final BuildContext context,
                              final int index,
                            ) {
                              final activity = state.activityLogList?[index];
                              //final activityDateAndTime = '${DateFormat('MMM dd, yyyy hh:mm a').parse(activity?.timestamp ?? '')} - ${DateFormat('jm').parse(activity?.timestamp ?? '')}';

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0,
                                    vertical: 30.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0XFF79B8FF),
                                    borderRadius: BorderRadius.circular(
                                      50.0,
                                    ),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8.0,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: StrokeTextField(
                                              text: utcDateToLocalString(
                                                date: activity?.timestamp ?? '',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: StrokeTextField(
                                              text:
                                                  'Activity: ${activity?.activityType}',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: StrokeTextField(
                                              text:
                                                  'Bookmark: ${activity?.bookmark}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      else
                        Flexible(
                          child: Center(
                            child: StrokeTextField(
                              text: 'No Activities Found',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0XFF7B38B1),
                height: MediaQuery.of(context).size.height * .06,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
