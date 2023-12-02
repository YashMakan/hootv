import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/config/routes/routes.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Image.asset(Assets.images.logoText),
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
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, AppRoutes.splashScreen);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                Assets.images.profileImage,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
