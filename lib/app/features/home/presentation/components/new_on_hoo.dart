import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

class NewOnHoo extends StatelessWidget {
  final List<MovieModel>? medias;

  const NewOnHoo({super.key, this.medias});

  bool get isLoading => medias == null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF124D34).withOpacity(0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset(Assets.images.newOnHoo),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Here are some of our newest releases\nthat you won't want to miss",
              style: context.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: isLoading
                    ? List.generate(4, (index) => newOnHooMovie(context))
                    : List.generate(
                        medias!.length,
                        (index) =>
                            newOnHooMovie(context, media: medias![index])),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget newOnHooMovie(context, {MovieModel? media}) {
    return Container(
      width: 140,
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
                  image: CachedNetworkImageProvider(media?.posterPathImage ?? ''),
                  fit: BoxFit.fill)
              .ifNotNull(media?.posterPathImage)),
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
                media?.title ?? '--',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
