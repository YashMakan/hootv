import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hootv/app/features/discover/presentation/blocs/discover_bloc/bloc.dart';
import 'package:hootv/app/features/discover/presentation/blocs/discover_search_bloc/bloc.dart';
import 'package:hootv/app/features/discover/presentation/components/discover_grid.dart';
import 'package:hootv/app/features/discover/presentation/components/discover_search_area.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/inject_dependency/dependencies.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiscoverScreen extends StatefulWidget {
  final ScrollController scrollController;

  const DiscoverScreen({super.key, required this.scrollController});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final discoverBloc = sl<DiscoverBloc>();
  final discoverSearchBloc = sl<DiscoverSearchBloc>();
  FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  void initState() {
    discoverBloc.add(FetchTrendingMediaEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 100.w,
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
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),
          BlocConsumer(
              bloc: discoverBloc,
              listenWhen: (previous, current) => current is DiscoverActionState,
              buildWhen: (previous, current) => current is! DiscoverActionState,
              builder: (context, state) {
                if (state is DiscoverLoadedState) {
                  return DiscoverGrid(
                    medias: state.medias,
                    scrollController: widget.scrollController,
                  );
                } else {
                  return DiscoverGrid(
                      scrollController: widget.scrollController);
                }
              },
              listener: (context, state) {}),
          SafeArea(
            child: FloatingSearchBar(
              hintStyle: context.titleMedium,
              controller: controller,
              leadingActions: [
                FloatingSearchBarAction.back(),
              ],
              actions: [
                FloatingSearchBarAction.searchToClear(),
              ],
              clearQueryOnClose: true,
              debounceDelay: const Duration(milliseconds: 800),
              initiallyHidden: false,
              onFocusChanged: (focus){
                discoverSearchBloc.add(ResetMediasEvent());
              },
              onQueryChanged: (value) {
                discoverSearchBloc.add(SearchForMediasEvent(value));
              },
              margins:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 32),
              borderRadius: BorderRadius.circular(8),
              builder: (context, transition) {
                return const DiscoverSearchArea();
              },
            ),
          )
        ],
      ),
    );
  }
}
