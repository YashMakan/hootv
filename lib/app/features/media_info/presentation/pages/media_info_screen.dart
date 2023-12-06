import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hootv/app/features/media_info/presentation/blocs/media_credits_bloc/bloc.dart';
import 'package:hootv/app/features/media_info/presentation/blocs/media_info_bloc/bloc.dart';
import 'package:hootv/app/features/media_info/presentation/blocs/media_info_videos_bloc/bloc.dart';
import 'package:hootv/app/features/media_info/presentation/components/cast_list_widget.dart';
import 'package:hootv/app/features/media_info/presentation/components/cast_widget.dart';
import 'package:hootv/app/features/media_info/presentation/components/description_widget.dart';
import 'package:hootv/app/features/media_info/presentation/components/expanded_header_section.dart';
import 'package:hootv/app/features/media_info/presentation/components/more_like_this_widget.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/inject_dependency/dependencies.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaInfoScreen extends StatefulWidget {
  const MediaInfoScreen({super.key});

  @override
  State<MediaInfoScreen> createState() => _MediaInfoScreenState();
}

class _MediaInfoScreenState extends State<MediaInfoScreen> {
    final videoHeight = 140.0;
  final mediaInfoBloc = sl<MediaInfoBloc>();
  final mediaInfoVideosBloc = sl<MediaInfoVideosBloc>();
  final mediaCreditsBloc = sl<MediaCreditsBloc>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final media = ModalRoute.of(context)?.settings.arguments as MediaModel;
      if (media.mediaType == 'tv') {
        mediaInfoBloc
            .add(FetchMediaInfoEvent(tvShowModel: media as TvShowModel));
        // mediaInfoVideosBloc.add(FetchMediaVideosEvent(tvShowModel: media));
        mediaCreditsBloc.add(FetchMediaCreditsEvent(tvShowModel: media));
      } else {
        mediaInfoBloc.add(FetchMediaInfoEvent(movieModel: media as MovieModel));
        // mediaInfoVideosBloc.add(FetchMediaVideosEvent(movieModel: media));
        mediaCreditsBloc.add(FetchMediaCreditsEvent(movieModel: media));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = ModalRoute.of(context)?.settings.arguments as MediaModel;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<MediaInfoVideosBloc, MediaInfoVideosState>(
                  bloc: mediaInfoVideosBloc,
                  builder: (context, state) {
                    YoutubePlayerController getController(videos) =>
                        YoutubePlayerController(
                          initialVideoId: videos
                              .where((element) =>
                                  element.official &&
                                  element.site.toLowerCase() == 'youtube' &&
                                  (element.type == 'Trailer' ||
                                      element.type == 'Teaser'))
                              .last
                              .key,
                          flags: const YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        );
                    if (state is MovieVideosLoadedState) {
                      final controller = getController(state.videos);
                      return ExpandedHeaderSection(
                          media: media,
                          videos: state.videos,
                          controller: controller);
                    } else if (state is TvShowVideosLoadedState) {
                      final controller = getController(state.videos);
                      return ExpandedHeaderSection(
                          media: media,
                          videos: state.videos,
                          controller: controller);
                    } else {
                      return ExpandedHeaderSection(media: media);
                    }
                  },
                ),
                const SizedBox(height: 20 + 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<MediaInfoBloc, MediaInfoState>(
                        bloc: mediaInfoBloc,
                        builder: (context, state) {
                          if (state is MovieInfoLoadedState) {
                            return DescriptionWidget(
                                media: media, movieInfo: state.mediaInfo);
                          } else if (state is TvShowInfoLoadedState) {
                            return DescriptionWidget(
                                media: media, tvShowInfo: state.tvShowInfo);
                          } else {
                            return DescriptionWidget(media: media);
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Cast',
                        style: context.headlineSmall?.ultra
                            ?.copyWith(color: Colors.white, letterSpacing: 1.4),
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder(
                        bloc: mediaCreditsBloc,
                        builder: (context, state) {
                          if(state is MediaCreditsLoadedState) {
                            return CastListWidget(credits: state.credits);
                          } else {
                            return const CastListWidget();
                          }
                        }
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
                          itemBuilder: (context, index) =>
                              const MoreLikeThisWidget(),
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
                          itemBuilder: (context, index) =>
                              const MoreLikeThisWidget(),
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
