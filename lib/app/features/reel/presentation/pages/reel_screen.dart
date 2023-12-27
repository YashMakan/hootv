import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hootv/app/features/reel/presentation/blocs/reel_bloc/bloc.dart';
import 'package:hootv/app/features/reel/presentation/components/reel_screen_app_bar.dart';
import 'package:hootv/app/features/reel/presentation/components/reels_viewer.dart';
import 'package:hootv/app/shared/core/inject_dependency/dependencies.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  final reelBloc = sl<ReelBloc>();

  @override
  void initState() {
    reelBloc.add(FetchReelsEvent());
    // FirebaseManager.fetchVideos().then((videos) async {
    //   reelsList = List.generate(
    //       videos.length,
    //       (index) => ReelModel(videos[index].videoUrl, videos[index].title,
    //               likeCount: 0,
    //               isLiked: true,
    //               reeldescription: videos[index].description,
    //               reelusername: videos[index].title,
    //               profileUrl: videos[index].pUrl,
    //               commentList: [
    //                 ReelCommentModel(
    //                   comment: 'Nice...',
    //                   userProfilePic:
    //                       'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    //                   userName: 'Darshan',
    //                   commentTime: DateTime.now(),
    //                 ),
    //                 ReelCommentModel(
    //                   comment: 'Superr...',
    //                   userProfilePic:
    //                       'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    //                   userName: 'Darshan',
    //                   commentTime: DateTime.now(),
    //                 ),
    //                 ReelCommentModel(
    //                   comment: 'Great...',
    //                   userProfilePic:
    //                       'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    //                   userName: 'Darshan',
    //                   commentTime: DateTime.now(),
    //                 ),
    //               ]));
    //   await Future.delayed(Duration(seconds: 2));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BlocBuilder<ReelBloc, ReelState>(
            bloc: reelBloc,
            buildWhen: (previous, current) => current is! ReelActionState,
            builder: (context, state) {
              if (state is ReelLoadedState) {
                return ReelsViewer(
                  reelsList: state.reels,
                  onShare: (url) {
                    log('Shared reel url ==> $url');
                  },
                  onLike: (url) {
                    log('Liked reel url ==> $url');
                  },
                  onFollow: () {
                    log('======> Clicked on follow <======');
                  },
                  onComment: (comment) {
                    log('Comment on reel ==> $comment');
                  },
                  onClickMoreBtn: () {
                    log('======> Clicked on more option <======');
                  },
                  onClickBackArrow: () {
                    log('======> Clicked on back arrow <======');
                  },
                  onIndexChanged: (index) {
                    log('======> Current Index ======> $index <========');
                  },
                  showProgressIndicator: true,
                  showVerifiedTick: false,
                  showAppbar: false,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          const ReelScreenAppBar()
        ],
      ),
    );
  }
}
