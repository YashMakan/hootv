import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/genre.dart';
import 'package:hootv/app/features/media_info/data/models/movie_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/tv_show_info_model.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DescriptionWidget extends StatelessWidget {
  final MediaModel media;
  final MovieInfoModel? movieInfo;
  final TvShowInfoModel? tvShowInfo;

  const DescriptionWidget(
      {super.key, required this.media, this.movieInfo, this.tvShowInfo});

  bool isAdultMedia(MediaModel media) => media.adult ?? false;

  List<Genre>? get genres => movieInfo?.genres ?? tvShowInfo?.genres;

  int? get runtime =>
      movieInfo?.runtime ??
      (tvShowInfo?.episodeRunTime.isNotEmpty ?? false
          ? tvShowInfo?.episodeRunTime
              .reduce((value, element) => value + element)
          : null);

  DateTime? get releaseDate => movieInfo != null
      ? DateFormat('yyyy-MM-dd').parse(movieInfo!.releaseDate)
      : DateFormat('yyyy-MM-dd').parse(tvShowInfo!.firstAirDate);

  bool get isApiLoaded => movieInfo != null || tvShowInfo != null;

  @override
  Widget build(BuildContext context) {
    const spacing = 6.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          media.title ?? media.name ?? '--',
          maxLines: 2,
          minFontSize: 22,
          maxFontSize: 32,
          wrapWords: false,
          style: context.displayMedium?.ultra?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                const BoxShadow(color: Colors.black54, blurRadius: 20)
              ]),
        ),
        const SizedBox(height: 8),
        if (isApiLoaded)
          DefaultTextStyle(
            style: const TextStyle(color: Colors.white60),
            child: Row(
              children: [
                if (isAdultMedia(media)) ...[
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.white)),
                    child: const Text('A'),
                  ),
                  const SizedBox(width: spacing),
                  const Text('•'),
                  const SizedBox(width: spacing),
                ],
                if (runtime != null) ...[
                  Text('${runtime! ~/ 60}hr ${runtime! % 60}min'),
                  const SizedBox(width: spacing),
                  const Text('•'),
                ],
                if (releaseDate != null) ...[
                  const SizedBox(width: spacing),
                  Text(DateFormat('MMM, yyyy').format(releaseDate!)),
                ],
                const SizedBox(width: spacing),
                const Text('•'),
                const SizedBox(width: spacing),
                Text("⭐ ${media.voteAverage?.toStringAsFixed(2) ?? '0'} "
                    "(${media.voteCount?.toString() ?? '0'})"),
              ],
            ),
          )
        else
          Container(
            height: 20,
            width: 60.w,
            color: Colors.grey.withOpacity(0.3),
          ).toShimmer(true),
        const SizedBox(height: 10),
        if (isApiLoaded)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  genres!.length,
                  (index) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54),
                            borderRadius: BorderRadius.circular(6)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          genres![index].name,
                          style:
                              context.bodySmall?.copyWith(color: Colors.white),
                        ),
                      )),
            ),
          )
        else
          Container(
            height: 20,
            width: 25.w,
            color: Colors.grey.withOpacity(0.3),
          ).toShimmer(true),
        const SizedBox(height: 16),
        ReadMoreText(
          media.overview ?? '',
          trimLength: 100,
          moreStyle: const TextStyle(color: CustomColors.primary),
          lessStyle: const TextStyle(color: CustomColors.primary),
          style: context.titleMedium
              ?.copyWith(color: Colors.white.withOpacity(0.8)),
        ),
      ],
    );
  }
}
