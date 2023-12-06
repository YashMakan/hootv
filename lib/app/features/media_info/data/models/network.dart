import 'package:json_annotation/json_annotation.dart';
part 'network.g.dart';

@JsonSerializable()
class Network {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'logo_path')
  final String logoPath;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'origin_country')
  final String originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
