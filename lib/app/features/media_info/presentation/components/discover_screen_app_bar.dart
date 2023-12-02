import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';

class DiscoverScreenAppBar extends StatelessWidget {
  const DiscoverScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text: 'Hey, ',
                  style: context.headlineMedium?.copyWith(color: Colors.white)),
              TextSpan(
                  text: 'Zandi 👋',
                  style: context.headlineMedium
                      ?.copyWith(color: CustomColors.primary)),
            ],
          )),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.20),
                      width: 1),
                  color: const Color.fromRGBO(31, 32, 34, 0.20),
                ),
                child: Center(
                  child: Image.asset(Assets.icons.notification),
                ),
              ),
              Positioned(
                top: -5,
                left: -5,
                child: CircleAvatar(
                  backgroundColor: CustomColors.primary,
                  maxRadius: 8,
                  child: Text(
                    "2",
                    style: context.labelSmall,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.20), width: 1),
              color: const Color.fromRGBO(31, 32, 34, 0.20),
            ),
            child: Center(
              child: Image.asset(Assets.icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
