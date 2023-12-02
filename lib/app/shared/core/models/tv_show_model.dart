import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_model.g.dart';

@JsonSerializable()
class TvShowModel extends Equatable {
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'name')
  final String title;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;

  const TvShowModel({
    this.posterPath,
    required this.title,
    required this.id,
    required this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowModelToJson(this);

  String? get posterPathImage => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500/${posterPath!}'
      : null;

  String? get backdropPathImage => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500/${backdropPath!}'
      : null;

  @override
  List<Object?> get props => [
    posterPath,
    title,
    id,
    adult,
    backdropPath,
    genreIds,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    firstAirDate,
    voteAverage,
    voteCount,
    originCountry,
  ];
}
