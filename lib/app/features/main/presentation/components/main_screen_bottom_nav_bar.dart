import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';

class MainScreenBottomNavBar extends StatelessWidget {
  final int currentBottomTabIndex;
  final List<String> bottomTabs;
  final Function(int index) onChange;

  const MainScreenBottomNavBar(
      {super.key,
      required this.currentBottomTabIndex,
      required this.bottomTabs,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF080808),
      child: SafeArea(
        bottom: true,
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              bottomTabs.length,
              (index) => IconButton(
                    onPressed: () {
                      onChange(index);
                    },
                    icon: Image.asset(index == currentBottomTabIndex &&
                            !(index == 1 || index == 3)
                        ? bottomTabs[index].replaceAll('_un', '')
                        : bottomTabs[index]),
                    color: index == currentBottomTabIndex
                        ? CustomColors.primary
                        : null,
                  )),
        ),
      ),
    );
  }
}
