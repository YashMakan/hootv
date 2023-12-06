import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/presentation/components/cast_widget.dart';
import 'package:hootv/app/features/media_info/presentation/components/more_like_this_widget.dart';
import 'package:hootv/app/features/media_player/presentation/pages/media_player.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MediaInfoScreen extends StatelessWidget {
  const MediaInfoScreen({super.key});

  bool isAdultMedia(MediaModel media) => media.adult ?? false;

  @override
  Widget build(BuildContext context) {
    final media = ModalRoute.of(context)?.settings.arguments as MediaModel;
    const spacing = 6.0;
    const castHeight = 100.0;
    const videoHeight = 140.0;
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  media.posterPathImage ?? ''))
                          .ifNotNull(media.posterPathImage)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 20.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                const Color(0xFF0D0D0D).withOpacity(0.3),
                                const Color(0xFF0D0D0D)
                              ])),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                bottom: -20,
                                left: 20,
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TorrentWebView(
                                                          magnetLink:
                                                              'https://webtorrent.io/torrents/sintel.torrent')));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: EdgeInsets.zero,
                                            fixedSize:
                                                const Size.fromWidth(150),
                                            foregroundColor: Colors.black),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.play_arrow_rounded,
                                                size: 42,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                "Play Now",
                                                style: context.titleMedium,
                                              )
                                            ],
                                          ),
                                        )),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.transparent,
                                            elevation: 0,
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.zero,
                                            fixedSize:
                                                const Size.fromWidth(150),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                side: const BorderSide(
                                                    color: Colors.white))),
                                        child: const Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.add),
                                              Text("My List")
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20 + 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
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
                              const BoxShadow(
                                  color: Colors.black54, blurRadius: 20)
                            ]),
                      ),
                      const SizedBox(height: 8),
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
                            const Text('1hr 28min'),
                            const SizedBox(width: spacing),
                            const Text('•'),
                            const SizedBox(width: spacing),
                            const Text('Apr'),
                            const SizedBox(width: spacing),
                            const Text('•'),
                            const SizedBox(width: spacing),
                            Text(
                                "⭐ ${media.voteAverage?.toStringAsFixed(2) ?? '0'} "
                                "(${media.voteCount?.toString() ?? '0'})"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ReadMoreText(
                        media.overview ?? '',
                        trimLength: 100,
                        moreStyle: const TextStyle(color: CustomColors.primary),
                        lessStyle: const TextStyle(color: CustomColors.primary),
                        style: context.titleMedium
                            ?.copyWith(color: Colors.white.withOpacity(0.8)),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Cast',
                        style: context.headlineSmall?.ultra
                            ?.copyWith(color: Colors.white, letterSpacing: 1.4),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: castHeight,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) => const CastWidget(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Trailer & more',
                        style: context.headlineSmall?.ultra
                            ?.copyWith(color: Colors.white, letterSpacing: 1.4),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: videoHeight,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) => const MoreLikeThisWidget(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'More like this',
                        style: context.headlineSmall?.ultra
                            ?.copyWith(color: Colors.white, letterSpacing: 1.4),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: videoHeight,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) => const MoreLikeThisWidget(),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
