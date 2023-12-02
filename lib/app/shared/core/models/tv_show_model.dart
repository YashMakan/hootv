import 'package:json_annotation/json_annotation.dart';

import 'media_model.dart';

part 'tv_show_model.g.dart';

@JsonSerializable()
class TvShowModel extends MediaModel {
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  const TvShowModel({
    String? posterPath,
    required String name,
    required int id,
    required bool adult,
    String? backdropPath,
    List<int>? genreIds,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    double? voteAverage,
    int? voteCount,
    List<String>? originCountry,
    String? mediaType,
    required this.firstAirDate,
  }) : super(
          posterPath: posterPath,
          name: name,
          id: id,
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          originalLanguage: originalLanguage,
          originalName: originalName,
          overview: overview,
          popularity: popularity,
          voteAverage: voteAverage,
          voteCount: voteCount,
          originCountry: originCountry,
          mediaType: mediaType,
        );

  factory TvShowModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowModelToJson(this);

  @override
  List<Object?> get props => super.props..add(firstAirDate);

  @override
  String? get posterPathImage => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500${posterPath!}'
      : null;

  @override
  String? get backdropPathImage => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500${backdropPath!}'
      : null;
}
