import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MediaVerticalCard extends StatelessWidget {
  final TvShowModel? show;

  const MediaVerticalCard({super.key, this.show});

  bool get isLoading => show == null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 36.h,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
                  image: CachedNetworkImageProvider(show?.posterPathImage ?? ''),
                  fit: BoxFit.fill)
              .ifNotNull(show?.posterPathImage)),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(Assets.images.shadow1))),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                show?.title ?? '',
                style: context.titleSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    ).toShimmer(isLoading);
  }
}
