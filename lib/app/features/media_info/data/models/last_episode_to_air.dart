import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air.g.dart';

@JsonSerializable()
class LastEpisodeToAir {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  @JsonKey(name: 'air_date')
  final String airDate;

  @JsonKey(name: 'episode_number')
  final int episodeNumber;

  @JsonKey(name: 'episode_type')
  final String episodeType;

  @JsonKey(name: 'production_code')
  final String productionCode;

  @JsonKey(name: 'runtime')
  final int runtime;

  @JsonKey(name: 'season_number')
  final int seasonNumber;

  @JsonKey(name: 'show_id')
  final int showId;

  @JsonKey(name: 'still_path')
  final String stillPath;

  LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}
