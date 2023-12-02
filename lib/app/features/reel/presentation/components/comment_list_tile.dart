import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_comment_model.dart';
import 'package:hootv/app/shared/core/utils/date_formatter.dart';

class CommentListTile extends StatelessWidget {
  final ReelCommentModel commentItem;

  const CommentListTile({Key? key, required this.commentItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: commentItem.userProfilePic,
            alignment: Alignment.centerLeft,
            imageBuilder: (context, imageProvider) => Container(
              height: 32,
              width: 32,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 20,
              width: 20,
              child: Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                commentItem.userName,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 41, 35, 35),
                ),
              ),
              Text(
                commentItem.comment,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 69, 67, 67),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                DateFormatter.getTimeAgo(commentItem.commentTime),
                style: const TextStyle(
                  fontSize: 9,
                  color: Color.fromARGB(255, 41, 35, 35),
                ),
              ),
            ],
          )
          // ),
        ],
      ),
    );
  }
}
