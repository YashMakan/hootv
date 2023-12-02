import 'package:json_annotation/json_annotation.dart';

import 'media_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends MediaModel {
  const MovieModel({
    bool? adult,
    String? backdropPath,
    required int id,
    String? title,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? mediaType,
    List<int>? genreIds,
    double? popularity,
    String? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          id: id,
          title: title,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          posterPath: posterPath,
          mediaType: mediaType,
          genreIds: genreIds,
          popularity: popularity,
          releaseDate: releaseDate,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  List<Object?> get props => super.props..add(releaseDate);
}
