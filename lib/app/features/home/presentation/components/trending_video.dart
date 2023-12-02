import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendingVideo extends StatelessWidget {
  final MovieModel media;

  const TrendingVideo({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: SizedBox(
        width: 56.w,
        child: Column(
          children: [
            Container(
              width: 56.w,
              height: 14.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                          image: NetworkImage(media.posterPathImage!),
                          fit: BoxFit.cover)
                      .ifNotNull(media.posterPathImage)),
              child: Center(
                child: Icon(
                  Icons.play_circle_outlined,
                  color: Colors.white.withOpacity(0.5),
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(media.title ?? '',
                  style: context.bodyMedium?.copyWith(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
