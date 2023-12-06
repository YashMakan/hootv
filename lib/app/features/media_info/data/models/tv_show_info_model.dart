import 'package:hootv/app/features/media_info/data/models/created_by.dart';
import 'package:hootv/app/features/media_info/data/models/genre.dart';
import 'package:hootv/app/features/media_info/data/models/last_episode_to_air.dart';
import 'package:hootv/app/features/media_info/data/models/network.dart';
import 'package:hootv/app/features/media_info/data/models/production_company.dart';
import 'package:hootv/app/features/media_info/data/models/production_country.dart';
import 'package:hootv/app/features/media_info/data/models/season.dart';
import 'package:hootv/app/features/media_info/data/models/spoken_language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_info_model.g.dart';

@JsonSerializable()
class TvShowInfoModel {
  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'created_by')
  final List<CreatedBy> createdBy;

  @JsonKey(name: 'episode_run_time')
  final List<int> episodeRunTime;

  @JsonKey(name: 'first_air_date')
  final String firstAirDate;

  @JsonKey(name: 'genres')
  final List<Genre> genres;

  @JsonKey(name: 'homepage')
  final String homepage;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'in_production')
  final bool inProduction;

  @JsonKey(name: 'languages')
  final List<String> languages;

  @JsonKey(name: 'last_air_date')
  final String lastAirDate;

  @JsonKey(name: 'last_episode_to_air')
  final LastEpisodeToAir lastEpisodeToAir;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'next_episode_to_air')
  final dynamic nextEpisodeToAir;

  @JsonKey(name: 'networks')
  final List<Network> networks;

  @JsonKey(name: 'number_of_episodes')
  final int numberOfEpisodes;

  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;

  @JsonKey(name: 'origin_country')
  final List<String> originCountry;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_name')
  final String originalName;

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

  @JsonKey(name: 'seasons')
  final List<Season> seasons;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'tagline')
  final String tagline;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  TvShowInfoModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowInfoModelToJson(this);
}
