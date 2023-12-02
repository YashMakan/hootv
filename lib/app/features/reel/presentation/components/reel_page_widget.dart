import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_model.dart';
import 'package:hootv/app/features/reel/presentation/components/reel_screen_options.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/core/utils/url_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReelPageWidget extends StatefulWidget {
  final ReelModel item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final SwiperController swiperController;
  final bool showProgressIndicator;

  const ReelPageWidget({
    Key? key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    this.showProgressIndicator = true,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<ReelPageWidget> createState() => _ReelPageWidgetState();
}

class _ReelPageWidgetState extends State<ReelPageWidget> {
  // late VideoPlayerController _videoPlayerController;
  // ChewieController? _chewieController;
  late YoutubePlayerController controller;

  bool _liked = false;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.item.id!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    if (!UrlChecker.isImageUrl(widget.item.url) &&
        UrlChecker.isValid(widget.item.url)) {
      // initializePlayer();
    }
  }

  // Future initializePlayer() async {
  //   _videoPlayerController = VideoPlayerController.network(widget.item.url);
  //   await Future.wait([_videoPlayerController.initialize()]);
  //   _chewieController = ChewieController(
  //     videoPlayerController: _videoPlayerController,
  //     autoPlay: true,
  //     showControls: false,
  //     looping: false,
  //   );
  //   _videoPlayerController.addListener(() {
  //     if (_videoPlayerController.value.position ==
  //         _videoPlayerController.value.duration) {
  //       widget.swiperController.next();
  //     }
  //   });
  // }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    // _chewieController?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // _chewieController != null &&
        //         _chewieController!.videoPlayerController.value.isInitialized
        true
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                  onDoubleTap: () {
                    // if (!widget.item.isLiked) {
                    //   _liked = true;
                    //   if (widget.onLike != null) {
                    //     widget.onLike!(widget.item.url);
                    //   }
                    //
                    // }
                  },
                  child: YoutubePlayer(
                    controller: controller,
                    aspectRatio: 9 / 16,
                  ),
                  // child: Chewie(
                  //   controller: _chewieController!,
                  // ),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          const Center(
            child: Icon(Icons.favorite, size: 50, color: Colors.red),
          ),
        // if (widget.showProgressIndicator)
        //   Positioned(
        //     bottom: 0,
        //     width: MediaQuery.of(context).size.width,
        //     child: VideoProgressIndicator(
        //       _videoPlayerController,
        //       allowScrubbing: false,
        //       colors: const VideoProgressColors(
        //         backgroundColor: Colors.blueGrey,
        //         bufferedColor: Colors.blueGrey,
        //         playedColor: CustomColors.primary,
        //       ),
        //     ),
        //   ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            Assets.images.shadow3,
            width: 100.w,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          child: ReelScreenOptions(
            onClickMoreBtn: widget.onClickMoreBtn,
            onComment: widget.onComment,
            onFollow: widget.onFollow,
            onLike: widget.onLike,
            onShare: widget.onShare,
            showVerifiedTick: widget.showVerifiedTick,
            item: widget.item,
          ),
        )
      ],
    );
  }
}
