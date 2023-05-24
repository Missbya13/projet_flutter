import 'package:json_annotation/json_annotation.dart';

part 'meteo_model.g.dart';

@JsonSerializable()
class MeteoModel {
  Location location;
  Weather current;

  MeteoModel({
    required this.location,
    required this.current,
  });

  factory MeteoModel.fromJson(Map<String, dynamic> json) =>
      _$MeteoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeteoModelToJson(this);
}

@JsonSerializable()
class Location {
  String city;
  String region;
  String country;

  Location({
    required this.city,
    required this.region,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}


@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Weather {
  double tempC;
  double tempF;
  Condition condition;

  Weather({
    required this.tempC,
    required this.tempF,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Condition {
  String text;
  int code;

  Condition({
    required this.text,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
