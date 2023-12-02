// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowModel _$TvShowModelFromJson(Map<String, dynamic> json) => TvShowModel(
      posterPath: json['poster_path'] as String?,
      name: json['name'] as String,
      id: json['id'] as int,
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      originCountry: (json['original_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mediaType: json['media_type'] as String?,
      firstAirDate: json['first_air_date'] as String?,
    );

Map<String, dynamic> _$TvShowModelToJson(TvShowModel instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'name': instance.name,
      'original_name': instance.originalName,
      'original_country': instance.originCountry,
      'media_type': instance.mediaType,
      'first_air_date': instance.firstAirDate,
    };
