import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/constants/colors.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'trending_movie_card.dart';

class TrendingMovieList extends StatefulWidget {
  final List<MovieModel>? movies;

  const TrendingMovieList({super.key, this.movies});

  @override
  State<TrendingMovieList> createState() => _TrendingMovieListState();
}

class _TrendingMovieListState extends State<TrendingMovieList> {
  bool get isLoading => widget.movies == null;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: isLoading
              ? ([1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return const TrendingMovieCard();
                    },
                  );
                }).toList())
              : widget.movies!.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return TrendingMovieCard(movie: movie);
                    },
                  );
                }).toList(),
          options: CarouselOptions(
              height: 50.h,
              autoPlay: false,
              autoPlayAnimationDuration:
                  const Duration(seconds: 1, milliseconds: 500),
              onPageChanged: (index, _) {
                currentIndex = index % 5;
                setState(() {});
              }),
        ),
        const SizedBox(height: 16),
        CarouselIndicator(
          count: 5,
          width: 10,
          height: 10,
          activeColor: CustomColors.primary,
          index: currentIndex,
        ),
      ],
    );
  }
}
