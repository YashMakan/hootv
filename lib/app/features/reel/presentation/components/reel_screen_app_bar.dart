import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';

class ReelScreenAppBar extends StatelessWidget {
  const ReelScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 46;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0).copyWith(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: size,
                height: size,
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
                  child: Image.asset(Assets.icons.leftArrow),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: size,
                height: size,
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
                  child: Image.asset(Assets.icons.more),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
