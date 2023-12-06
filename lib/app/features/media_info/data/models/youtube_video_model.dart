import 'package:json_annotation/json_annotation.dart';

part 'youtube_video_model.g.dart';

@JsonSerializable()
class YouTubeVideoModel {
  @JsonKey(name: 'iso_639_1')
  final String iso639_1;

  @JsonKey(name: 'iso_3166_1')
  final String iso3166_1;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'key')
  final String key;

  @JsonKey(name: 'published_at')
  final String publishedAt;

  @JsonKey(name: 'site')
  final String site;

  @JsonKey(name: 'size')
  final int size;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'official')
  final bool official;

  @JsonKey(name: 'id')
  final String id;

  YouTubeVideoModel({
    required this.iso639_1,
    required this.iso3166_1,
    required this.name,
    required this.key,
    required this.publishedAt,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.id,
  });

  factory YouTubeVideoModel.fromJson(Map<String, dynamic> json) =>
      _$YouTubeVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$YouTubeVideoModelToJson(this);
}
