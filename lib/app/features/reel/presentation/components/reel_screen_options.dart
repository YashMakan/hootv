import 'package:flutter/material.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_model.dart';
import 'package:hootv/app/shared/config/assets/asset.dart';
import 'package:hootv/app/shared/core/utils/convert_numbers_to_short.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReelScreenOptions extends StatelessWidget {
  final ReelModel item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;

  const ReelScreenOptions({
    Key? key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double spacing = 12;
    return SizedBox(
      width: 100.w,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 8.0).copyWith(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const SizedBox(height: spacing + spacing / 2),
                    if (onLike != null && !item.isLiked)
                      IconButton(
                        icon: const Icon(Icons.favorite_outline,
                            color: Colors.white),
                        onPressed: () => onLike!(item.url),
                      ),
                    if (item.isLiked)
                      const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    Text(NumbersToShort.convertNumToShort(item.likeCount),
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: spacing - 4),
                    if (onShare != null)
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => onShare!(item.url),
                        icon: Image.asset(Assets.icons.share),
                      ),
                    const SizedBox(height: spacing),
                    if (onClickMoreBtn != null)
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image.asset(Assets.icons.save),
                        onPressed: onClickMoreBtn!,
                        color: Colors.white,
                      ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomChip(
                    text: "🎉🎉🎉",
                    color: Color(0xFFFFCB45),
                  ),
                  CustomChip(
                    text: "❤️‍🔥",
                    color: Color(0xFFFFCB45),
                  ),
                  CustomChip(
                    text: "🙄🙄",
                    color: Color(0xFFFFCB45),
                  ),
                  CustomChip(
                    text: "Cool!",
                    color: Color(0xFFFFCB45),
                  ),
                  CustomChip(
                    text: "😂😂😂",
                    color: Color(0xFFFFCB45),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final Color color;

  const CustomChip({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(32)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      )),
    );
  }
}
