import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:flutter_custom_tab_bar/indicator/round_indicator.dart';
import 'package:flutter_custom_tab_bar/transform/color_transform.dart';
import 'package:hootv/app/features/discover/presentation/blocs/discover_search_bloc/bloc.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/core/components/media_vertical_card.dart';
import 'package:hootv/app/shared/core/inject_dependency/dependencies.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiscoverSearchArea extends StatefulWidget {
  const DiscoverSearchArea({super.key});

  @override
  State<DiscoverSearchArea> createState() => _DiscoverSearchAreaState();
}

class _DiscoverSearchAreaState extends State<DiscoverSearchArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      color: CustomColors.background,
      child: BlocBuilder<DiscoverSearchBloc, DiscoverSearchState>(
        bloc: sl<DiscoverSearchBloc>(),
        builder: (context, state) {
          if (state is DiscoverSearchLoadedState) {
            return DiscoverSearchAreaBody(medias: state.medias);
          } else if (state is DiscoverSearchLoadingState) {
            return const DiscoverSearchAreaBody();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class DiscoverSearchAreaBody extends StatefulWidget {
  final List<MediaModel>? medias;

  const DiscoverSearchAreaBody({super.key, this.medias});

  @override
  State<DiscoverSearchAreaBody> createState() => _DiscoverSearchAreaBodyState();
}

class _DiscoverSearchAreaBodyState extends State<DiscoverSearchAreaBody> {
  late PageController controller = PageController(initialPage: 0);
  CustomTabBarController tabBarController = CustomTabBarController();
  List<String> tabs = const [
    'All',
    'Movies',
    'Tv Shows',
  ];

  List<MediaModel>? get medias {
    return widget.medias?.where((element) {
      if (tabBarController.currentIndex == 0) {
        return true;
      } else if (tabBarController.currentIndex == 1 &&
          element.mediaType == 'movie') {
        return true;
      } else if (tabBarController.currentIndex == 2 &&
          element.mediaType == 'tv') {
        return true;
      }
      return false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(34, 34, 34, 0.80),
                Color.fromRGBO(34, 34, 34, 0.16),
              ],
            ),
          ),
          child: CustomTabBar(
            tabBarController: tabBarController,
            height: 35,
            itemCount: tabs.length,
            builder: (context, index) => TabBarItem(
                transform: ColorsTransform(
                    highlightColor: Colors.black,
                    normalColor: Colors.white38,
                    builder: (context, color) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(minWidth: 80),
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: TextStyle(fontSize: 14, color: color),
                          ),
                        ),
                      );
                    }),
                index: index),
            indicator: RoundIndicator(
              color: CustomColors.primary,
              top: 2.5,
              bottom: 2.5,
              left: 2.5,
              right: 2.5,
              radius: BorderRadius.circular(15),
            ),
            pageController: controller,
          ),
        ),
        Expanded(
          child: PageView.builder(
              controller: controller,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.8),
                    itemCount: medias?.length ?? 8,
                    itemBuilder: (context, index) {
                      return MediaVerticalCard(
                        media: medias?.elementAt(index),
                      );
                    });
              }),
        ),
      ],
    );
  }
}
