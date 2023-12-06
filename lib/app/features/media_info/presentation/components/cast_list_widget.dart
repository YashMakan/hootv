import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/credits_model.dart';
import 'package:hootv/app/features/media_info/presentation/components/cast_widget.dart';

class CastListWidget extends StatelessWidget {
  final List<CreditsModel>? credits;

  const CastListWidget({super.key, this.credits});

  @override
  Widget build(BuildContext context) {
    const castHeight = 160.0;
    return SizedBox(
      height: castHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: credits?.length ?? 4,
        itemBuilder: (context, index) =>
            CastWidget(credit: credits?.elementAt(index)),
      ),
    );
  }
}
