import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContinueWatchingCard extends StatelessWidget {
  final MovieModel? movie;

  const ContinueWatchingCard({super.key, this.movie});

  bool get isLoading => movie == null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
                  image: CachedNetworkImageProvider(movie?.backdropPathImage ?? ''),
                  fit: BoxFit.fitWidth)
              .ifNotNull(movie?.backdropPathImage)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                movie?.title ?? '--',
                maxLines: 1,
                minFontSize: context.headlineSmall?.fontSize ?? 12,
                style: context.headlineLarge?.ultra?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      const BoxShadow(color: Colors.black54, blurRadius: 20)
                    ]),
              ),
              Text(
                movie?.overview ?? '',
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    ).toShimmer(isLoading);
  }
}
