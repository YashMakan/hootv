import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:hootv/app/features/discover/presentation/pages/discover_screen.dart';
import 'package:hootv/app/features/home/presentation/pages/home_screen.dart';
import 'package:hootv/app/features/main/presentation/components/main_screen_bottom_nav_bar.dart';
import 'package:hootv/app/features/reel/presentation/pages/reel_screen.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> bottomTabs = [
    Assets.icons.bottomUnHome,
    Assets.icons.bottomUnBookmark,
    Assets.icons.bottomAdd,
    Assets.icons.bottomUnDownloads,
    Assets.icons.bottomUnDiscovery,
  ];
  int currentBottomTabIndex = 0;
  int currentHomeIndex = 0;
  late List<ScrollController> homeScrollControllers;
  List<String> tabs = [
    'All',
    'Movies',
    'Short film',
    'Podcasts',
    'Documentaries'
  ];

  @override
  void initState() {
    homeScrollControllers =
        List.filled(tabs.length, ScrollController()).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      bottomNavigationBar: Hidable(
        controller: homeScrollControllers[currentHomeIndex],
        preferredWidgetSize: Size.fromHeight(8.h),
        child: MainScreenBottomNavBar(
          bottomTabs: bottomTabs,
          onChange: (index) => setState(() => currentBottomTabIndex = index),
          currentBottomTabIndex: currentBottomTabIndex,
        ),
      ),
      body: [
        HomeScreen(
          scrollController: homeScrollControllers[currentHomeIndex],
          tabs: tabs,
        ),
        const SizedBox(),
        const ReelScreen(),
        const SizedBox(),
        DiscoverScreen(
          scrollController: homeScrollControllers[currentHomeIndex],
        ),
      ][currentBottomTabIndex],
    );
  }
}
