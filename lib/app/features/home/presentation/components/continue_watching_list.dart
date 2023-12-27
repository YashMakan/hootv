import 'package:flutter/material.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

import 'continue_watching_card.dart';

class ContinueWatchingList extends StatelessWidget {
  final List<MovieModel>? movies;

  const ContinueWatchingList({super.key, this.movies});

  bool get isLoading => movies == null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: isLoading
            ? Row(
                children:
                    List.generate(4, (index) => const ContinueWatchingCard()),
              )
            : Row(
                children: List.generate(movies!.length,
                    (index) => ContinueWatchingCard(movie: movies![index])),
              ),
      ),
    );
  }
}
