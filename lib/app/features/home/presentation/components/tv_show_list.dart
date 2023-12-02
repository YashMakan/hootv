import 'package:flutter/material.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

import 'media_vertical_card.dart';

class TvShowList extends StatelessWidget {
  final List<TvShowModel>? shows;

  const TvShowList({super.key, this.shows});

  bool get isLoading => shows == null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: isLoading
              ? List.generate(4, (index) => const MediaVerticalCard())
              : List.generate(shows!.length,
                  (index) => MediaVerticalCard(show: shows![index])),
        ),
      ),
    );
  }
}
