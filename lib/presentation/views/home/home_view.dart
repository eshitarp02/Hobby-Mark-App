import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/blocs/home/home_bloc.dart';
import 'package:to_do_app/core/consts/asset_images.dart';
import 'package:to_do_app/core/consts/strings.dart';
import 'package:to_do_app/core/utils/palette.dart';
import 'package:to_do_app/core/utils/string_extension.dart';
import 'package:to_do_app/domain/repositories/auth/auth_repository.dart';
import 'package:to_do_app/presentation/widgets/home/i_am_bored_empty_pop_up.dart';
import 'package:to_do_app/presentation/widgets/home/suggested_for_you_pop_up.dart';
import 'package:to_do_app/presentation/widgets/loading_widget.dart';
import 'package:to_do_app/routes/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is HomeOnLoadState &&
            state.isActivityLogPopUps &&
            (state.suggestionsList ?? []).isEmpty) {
          showIamBoredEmptyPopUp(
            context: context,
          );
        }
        if (state is HomeOnLoadState &&
            state.isActivityLogPopUps &&
            (state.suggestionsList ?? []).isNotEmpty) {
          final homeBloc = BlocProvider.of<HomeBloc>(context);
          final isShowBackArrow = state.currentActivityIndex > 0;
          final isShowForwardArrow = (state.currentActivityIndex + 1) <
              (state.suggestionsList ?? []).length;
          showSuggestedForYouPopUp(
            context: context,
            contentText: state.suggestionsList?[state.currentActivityIndex]
                    .bodyLines?[0] ??
                '',
            isShowBackArrow: isShowBackArrow,
            isShowForwardArrow: isShowForwardArrow,
            onPreviousPressed: () {
              homeBloc.add(
                PreviousActivityEvent(),
              );
            },
            onNextPressed: () {
              homeBloc.add(
                NextActivityEvent(),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is HomeOnLoadState) {
          return Scaffold(
            key: scaffoldKey,
            drawer: _drawerWidget(
              context: context,
              firstName: 'Test User',
            ),
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetPNGImages.appBackGround,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                                scaffoldKey.currentState?.openDrawer();
                              },
                              child: Image.asset(
                                AssetPNGImages.threeDots,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width * .65,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AssetPNGImages.quickStats,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    AssetPNGImages.quickStatsText,
                                    height: 80.0,
                                    width: 150.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .15,
                            width: MediaQuery.of(context).size.width * .65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AssetPNGImages.progressTracker,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  AssetPNGImages.progressTrackerText,
                                  height: 80.0,
                                  width: 200.0,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .75,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.pushNamed(Routes.logNewActivity.name);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                child: Text(
                                  'Log in New Activity',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .75,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.pushNamed(Routes.activityLog.name);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                child: Text(
                                  'View all the activities',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .85,
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<HomeBloc>(context).add(
                                    GetActivityLogListEvent(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0XFFFFD48E),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                child: state.isActivityLogListLoadingInProgress
                                    ? SizedBox(
                                        height: 25.0,
                                        width: 25.0,
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      )
                                    : Image.asset(
                                        AssetPNGImages.iAmBoard,
                                        height: 24.0,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .18,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0XFF5299d9),
                              Color(0XFF95CCE8),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              53.0,
                            ),
                            topRight: Radius.circular(
                              53.0,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .55,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0XFF534FCF),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2.0,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Set your Goal',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .55,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0XFF534FCF),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 2.0,
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Your Achievements',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0XFF7B38B1),
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Widget _drawerWidget({
    required BuildContext context,
    required String firstName,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        top: 25.0,
      ),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: 200,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  spacing: 14.0,
                  children: [
                    InkWell(
                      onTap: () {
                        scaffoldKey.currentState?.closeDrawer();
                      },
                      child: SvgPicture.asset(
                        AssetSVGImages.back,
                      ),
                    ),
                    CircleAvatar(
                      radius: 21.0,
                      backgroundColor: Palette.textBlue,
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Palette.lowLightBlue,
                        child: Text(
                          firstName[0].toUpperCase(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.0,
                      children: [
                        Text(
                          firstName,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              color: Palette.drawerDividerColor,
            ),
          ),
          _menuItem(
            context: context,
            image: AssetSVGImages.logOut,
            title: Strings.logOut,
            onTapTile: () async {
              scaffoldKey.currentState?.closeDrawer();
              final authRepo = GetIt.I<AuthRepository>();
              await authRepo.logoutUser();
              await router.pushNamed(Routes.login.name);
            },
          ),
          Divider(
            color: Palette.drawerDividerColor,
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required BuildContext context,
    required String image,
    required String title,
    required VoidCallback onTapTile,
  }) {
    return InkWell(
      onTap: onTapTile,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          spacing: 14.0,
          children: [
            SvgPicture.asset(
              image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
