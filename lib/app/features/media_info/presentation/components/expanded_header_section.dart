import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/youtube_video_model.dart';
import 'package:hootv/app/features/media_player/presentation/pages/media_player.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExpandedHeaderSection extends StatefulWidget {
  final MediaModel media;
  final List<YouTubeVideoModel>? videos;
  final YoutubePlayerController? controller;

  const ExpandedHeaderSection({
    super.key,
    required this.media,
    this.videos,
    this.controller,
  });

  @override
  State<ExpandedHeaderSection> createState() => _ExpandedHeaderSectionState();
}

class _ExpandedHeaderSectionState extends State<ExpandedHeaderSection> {
  bool get isApiLoaded => widget.videos != null;
  bool isReady = false;

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          image: widget.controller == null || !isReady
              ? DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          widget.media.posterPathImage ?? ''))
                  .ifNotNull(widget.media.posterPathImage)
              : null),
      child: Stack(
        children: [
          if (widget.controller != null)
            Opacity(
              opacity: isReady ? 1 : 0,
              child: YoutubePlayer(
                controller: widget.controller!,
                onReady: () {
                  isReady = true;
                  setState(() {});
                },
                aspectRatio: 9 / 16,
              ),
            ),
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
                    CustomColors.background.withOpacity(0.3),
                    CustomColors.background
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
                                      builder: (context) => const TorrentWebView(
                                          magnetLink:
                                              'https://webtorrent.io/torrents/sintel.torrent')));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                                fixedSize: const Size.fromWidth(150),
                                foregroundColor: Colors.black),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                                fixedSize: const Size.fromWidth(150),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:
                                        const BorderSide(color: Colors.white))),
                            child: const Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [Icon(Icons.add), Text("My List")],
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
    );
  }
}
