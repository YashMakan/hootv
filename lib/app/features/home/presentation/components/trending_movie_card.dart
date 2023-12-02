import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class TrendingMovieCard extends StatelessWidget {
  final MovieModel? movie;

  const TrendingMovieCard({super.key, this.movie});

  bool get isLoading => movie == null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      decoration: BoxDecoration(
          image: DecorationImage(
                  image: CachedNetworkImageProvider(movie?.posterPathImage ?? ''),
                  fit: BoxFit.fill)
              .ifNotNull(movie?.posterPathImage),
          borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(Assets.images.shadow1)),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(Assets.images.top10),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        movie?.title ?? '--',
                        maxLines: 2,
                        minFontSize: 34,
                        wrapWords: false,
                        style: context.displayMedium?.ultra?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              const BoxShadow(
                                  color: Colors.black54, blurRadius: 20)
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                miniProfile(-0.05,
                                    "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
                                Positioned(
                                  left: 16,
                                  child: miniProfile(0,
                                      "https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1899&q=80"),
                                ),
                                Positioned(
                                  left: 32,
                                  child: miniProfile(0.05,
                                      "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1286&q=80"),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "+3 watching",
                            style: context.bodyMedium
                                ?.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 55.w,
                        height: 35,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
                                      foregroundColor: Colors.black),
                                  child: const Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.play_arrow_rounded),
                                        Text("Play")
                                      ],
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
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
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    ).toShimmer(isLoading);
  }

  miniProfile(angle, image) {
    return Transform.rotate(
      angle: pi * angle,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                fit: BoxFit.fitWidth, image: NetworkImage(image))),
      ),
    );
  }
}
