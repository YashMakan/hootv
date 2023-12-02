// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelModel _$ReelModelFromJson(Map<String, dynamic> json) => ReelModel(
      id: json['id'] as String?,
      url: json['url'] as String,
      videoUrl: json['video_url'] as String?,
      isLiked: json['is_liked'] as bool? ?? false,
      likeCount: json['like_count'] as int? ?? 0,
    );

Map<String, dynamic> _$ReelModelToJson(ReelModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'video_url': instance.videoUrl,
      'is_liked': instance.isLiked,
      'like_count': instance.likeCount,
    };
