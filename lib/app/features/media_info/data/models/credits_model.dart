import 'package:hootv/app/shared/config/constants/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credits_model.g.dart';

@JsonSerializable()
class CreditsModel {
  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'gender')
  final int gender;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'original_name')
  final String originalName;

  @JsonKey(name: 'popularity')
  final double popularity;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @JsonKey(name: 'cast_id')
  final int castId;

  @JsonKey(name: 'character')
  final String character;

  @JsonKey(name: 'credit_id')
  final String creditId;

  @JsonKey(name: 'order')
  final int order;

  CreditsModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsModelToJson(this);

  GenderEnum get genderEnum =>
      gender == 1 ? GenderEnum.female : GenderEnum.male;

  String? get profilePathImage => profilePath != null
      ? 'https://image.tmdb.org/t/p/w500${profilePath!}'
      : null;
}
