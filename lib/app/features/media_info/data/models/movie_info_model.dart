import 'package:hootv/app/features/media_info/data/models/genre.dart';
import 'package:hootv/app/features/media_info/data/models/production_company.dart';
import 'package:hootv/app/features/media_info/data/models/production_country.dart';
import 'package:hootv/app/features/media_info/data/models/spoken_language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_info_model.g.dart';

@JsonSerializable()
class MovieInfoModel {
  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;

  @JsonKey(name: 'budget')
  final int budget;

  @JsonKey(name: 'genres')
  final List<Genre> genres;

  @JsonKey(name: 'homepage')
  final String homepage;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'imdb_id')
  final String imdbId;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'popularity')
  final double popularity;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'revenue')
  final int revenue;

  @JsonKey(name: 'runtime')
  final int runtime;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'tagline')
  final String tagline;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'video')
  final bool video;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  MovieInfoModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoModelToJson(this);
}



