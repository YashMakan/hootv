import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable()
class CreatedBy {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'credit_id')
  final String creditId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'gender')
  final int gender;

  @JsonKey(name: 'profile_path')
  final String profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
