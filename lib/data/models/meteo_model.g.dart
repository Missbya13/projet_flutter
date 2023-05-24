// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeteoModel _$MeteoModelFromJson(Map<String, dynamic> json) => MeteoModel(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: Weather.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeteoModelToJson(MeteoModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      city: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.city,
      'region': instance.region,
      'country': instance.country,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) =>
    Weather(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition:
          Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) =>
    Condition(
      text: json['text'] as String,
      code: json['code'] as int,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'code': instance.code,
    };
