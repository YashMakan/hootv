import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';
import 'tv_show_model.dart';

class MediaModel extends Equatable {
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'adult')
  final bool? adult;

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

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'video')
  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'original_country')
  final List<String>? originCountry;

  @JsonKey(name: 'media_type')
  final String? mediaType;

  const MediaModel(
      {required this.id,
      this.posterPath,
      this.name,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.voteAverage,
      this.voteCount,
      this.originCountry,
      this.mediaType,
      this.title,
      this.originalTitle,
      this.releaseDate,
      this.video});

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    if (json['media_type'] == 'tv') {
      return TvShowModel.fromJson(json);
    } else if (json['media_type'] == 'movie') {
      return MovieModel.fromJson(json);
    } else {
      throw Exception('Invalid media type');
    }
  }

  String? get posterPathImage => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500${posterPath!}'
      : null;

  String? get backdropPathImage => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500${backdropPath!}'
      : null;

  @override
  List<Object?> get props => [
        posterPath,
        name,
        id,
        adult,
        backdropPath,
        genreIds,
        originalLanguage,
        originalName,
        overview,
        popularity,
        voteAverage,
        voteCount,
        originCountry,
      ];
}
