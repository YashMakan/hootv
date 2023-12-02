// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelCommentModel _$ReelCommentModelFromJson(Map<String, dynamic> json) =>
    ReelCommentModel(
      id: json['id'] as String?,
      comment: json['comment'] as String,
      userProfilePic: json['userProfilePic'] as String,
      userName: json['userName'] as String,
      commentTime: DateTime.parse(json['commentTime'] as String),
    );

Map<String, dynamic> _$ReelCommentModelToJson(ReelCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'userProfilePic': instance.userProfilePic,
      'userName': instance.userName,
      'commentTime': instance.commentTime.toIso8601String(),
    };
