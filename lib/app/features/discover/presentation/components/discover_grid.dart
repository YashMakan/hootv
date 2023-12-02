import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/core/components/section_heading_widget.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiscoverGrid extends StatelessWidget {
  final List<MediaModel>? medias;
  final ScrollController? scrollController;

  const DiscoverGrid({super.key, this.medias, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16.h),
      child: SectionHeadingWidget(
        title: "People search for",
        padding: EdgeInsets.zero,
        child: Expanded(
          child: MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: EdgeInsets.zero,
            itemCount: medias?.length ?? 8,
            controller: scrollController,
            itemBuilder: (context, index) {
              return Tile(
                media: medias?[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final MediaModel? media;

  const Tile({Key? key, this.media}) : super(key: key);

  bool get isLoading => media == null;

  bool get isMovie => media?.mediaType == 'movie';

  String? get image =>
      isMovie ? media?.backdropPathImage : media?.posterPathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMovie ? 100 : 280,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          image: DecorationImage(
                  image: CachedNetworkImageProvider(image ?? ''),
                  fit: BoxFit.cover)
              .ifNotNull(image),
          borderRadius: BorderRadius.circular(8)),
    ).toShimmer(isLoading);
  }
}
