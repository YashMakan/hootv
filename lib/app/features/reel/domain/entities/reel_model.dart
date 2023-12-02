import 'package:json_annotation/json_annotation.dart';

part 'reel_model.g.dart';

@JsonSerializable()
class ReelModel {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'video_url')
  final String? videoUrl;

  @JsonKey(name: 'is_liked')
  final bool isLiked;

  @JsonKey(name: 'like_count')
  final int likeCount;

  ReelModel({
    this.id,
    required this.url,
    this.videoUrl,
    this.isLiked = false,
    this.likeCount = 0,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReelModelToJson(this);

  ReelModel copyWith({
    String? id,
    String? url,
    String? videoUrl,
    bool? isLiked,
    int? likeCount,
  }) {
    return ReelModel(
      id: id ?? this.id,
      url: url ?? this.url,
      videoUrl: videoUrl ?? this.videoUrl,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}
