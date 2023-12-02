import 'package:json_annotation/json_annotation.dart';

part 'reel_comment_model.g.dart';

@JsonSerializable()
class ReelCommentModel {
  final String? id;
  final String comment;
  final String userProfilePic;
  final String userName;
  final DateTime commentTime;

  ReelCommentModel({
    this.id,
    required this.comment,
    required this.userProfilePic,
    required this.userName,
    required this.commentTime,
  });

  factory ReelCommentModel.fromJson(Map<String, dynamic> json) => _$ReelCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReelCommentModelToJson(this);
}
