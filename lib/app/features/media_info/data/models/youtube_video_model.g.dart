// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YouTubeVideoModel _$YouTubeVideoModelFromJson(Map<String, dynamic> json) =>
    YouTubeVideoModel(
      iso639_1: json['iso_639_1'] as String,
      iso3166_1: json['iso_3166_1'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      publishedAt: json['published_at'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String,
      official: json['official'] as bool,
      id: json['id'] as String,
    );

Map<String, dynamic> _$YouTubeVideoModelToJson(YouTubeVideoModel instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso639_1,
      'iso_3166_1': instance.iso3166_1,
      'name': instance.name,
      'key': instance.key,
      'published_at': instance.publishedAt,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'id': instance.id,
    };
