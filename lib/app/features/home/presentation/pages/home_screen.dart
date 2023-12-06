import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_continue_watching_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_new_on_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_trending_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_tv_shows_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/components/continue_watching_list.dart';
import 'package:hootv/app/features/home/presentation/components/home_screen_app_bar.dart';
import 'package:hootv/app/features/home/presentation/components/new_on_hoo.dart';
import 'package:hootv/app/features/home/presentation/components/trending_movie_list.dart';
import 'package:hootv/app/features/home/presentation/components/trending_video.dart';
import 'package:hootv/app/features/home/presentation/components/tv_show_list.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/components/section_heading_widget.dart';
import 'package:hootv/app/shared/core/inject_dependency/dependencies.dart';
import 'package:hootv/app/features/home/data/models/trending_media.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  final List<String> tabs;

  const HomeScreen(
      {super.key,
      required this.scrollController,
      required this.tabs});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeTrendingBloc = sl<HomeTrendingBloc>();
  final homeContinueWatchingBloc = sl<HomeContinueWatchingBloc>();
  final homeNewOnBloc = sl<HomeNewOnBloc>();
  final homeTvShowsBloc = sl<HomeTvShowsBloc>();

  int get pageCount => widget.tabs.length;
  late PageController controller = PageController(initialPage: 0);
  CustomTabBarController tabBarController = CustomTabBarController();

  TrendingMovie trending = TrendingMovie(
    image: Assets.dummy.t1,
    title: "RAISING DION",
    description:
        "A single mother must hide her young son's superpowers to protect him from exploitation ...",
    subtitle: "2022 • Sci-fi/Action • 2 Seasons",
    medias: [],
    color: const Color(0xFF9B51E0),
    id: "0",
  );

  @override
  void initState() {
    if (homeTrendingBloc.state is HomeTrendingInitialState) {
      homeTrendingBloc.add(FetchTrendingMoviesEvent());
    }
    if (homeContinueWatchingBloc.state is HomeContinueWatchingInitialState) {
      homeContinueWatchingBloc.add(FetchContinueWatchingMediasEvent());
    }
    if (homeNewOnBloc.state is HomeNewOnInitialState) {
      homeNewOnBloc.add(FetchNewOnMediasEvent());
    }
    if (homeTvShowsBloc.state is HomeTvShowsInitialState) {
      homeTvShowsBloc.add(FetchTvShowsEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: <Widget>[
          Container(
            width: 60.w,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.0, 0.0),
                end: const Alignment(0.0, 1.0),
                colors: [
                  const Color(0xFF2A0552).withOpacity(0.7),
                  const Color(0x00000000),
                ],
                stops: const [0.0, 0.5],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const HomeScreenAppBar(),
                const SizedBox(height: 20),
                Expanded(
                    child: PageView.builder(
                        controller: controller,
                        itemCount: pageCount,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            controller: widget
                                .scrollController,
                            child: Column(
                              children: [
                                BlocBuilder<HomeTrendingBloc,
                                        HomeTrendingState>(
                                    bloc: homeTrendingBloc,
                                    buildWhen: (previous, current) =>
                                        current is! HomeTrendingActionState,
                                    builder: (context, state) {
                                      if (state is HomeTrendingLoadedState) {
                                        return TrendingMovieList(
                                            movies: state.movies);
                                      } else {
                                        return const TrendingMovieList();
                                      }
                                    }),
                                const SizedBox(height: 21),
                                SectionHeadingWidget(
                                  title: "Continue Watching",
                                  child: BlocBuilder<HomeContinueWatchingBloc,
                                          HomeContinueWatchingState>(
                                      bloc: homeContinueWatchingBloc,
                                      buildWhen: (previous, current) => current
                                          is! HomeContinueWatchingActionState,
                                      builder: (context, state) {
                                        if (state
                                            is HomeContinueWatchingLoadedState) {
                                          return ContinueWatchingList(
                                            movies: state.movies,
                                          );
                                        } else {
                                          return const ContinueWatchingList();
                                        }
                                      }),
                                ),
                                const SizedBox(height: 21),
                                BlocBuilder<HomeNewOnBloc, HomeNewOnState>(
                                    bloc: homeNewOnBloc,
                                    buildWhen: (previous, current) =>
                                        current is! HomeNewOnActionState,
                                    builder: (context, state) {
                                      if (state is HomeNewOnLoadedState) {
                                        return NewOnHoo(medias: state.movies);
                                      } else {
                                        return const NewOnHoo();
                                      }
                                    }),
                                const SizedBox(height: 21),
                                SectionHeadingWidget(
                                    title: "TV Shows",
                                    child: BlocBuilder<HomeTvShowsBloc,
                                            HomeTvShowsState>(
                                        bloc: homeTvShowsBloc,
                                        buildWhen: (previous, current) =>
                                            current is! HomeTvShowsActionState,
                                        builder: (context, state) {
                                          if (state is HomeTvShowsLoadedState) {
                                            return TvShowList(
                                                shows: state.tvShows);
                                          } else {
                                            return const TvShowList();
                                          }
                                        })),
                                const SizedBox(height: 26),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        colors: [
                                          trending.color.withOpacity(1),
                                          trending.color.withOpacity(0.4),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(trending.image),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          trending.title,
                                          style: context.headlineLarge?.ultra
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                const BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 8)
                                              ]),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          trending.subtitle,
                                          style: context.bodyMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          trending.description,
                                          style: context.bodyMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                                trending.medias.length,
                                                (index) => TrendingVideo(
                                                    media: trending
                                                        .medias[index])),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 22),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                )
                              ],
                            ),
                          );
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
