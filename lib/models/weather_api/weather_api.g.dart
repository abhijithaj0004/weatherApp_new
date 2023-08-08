// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApi _$WeatherApiFromJson(Map<String, dynamic> json) => WeatherApi(
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WeatherApiToJson(WeatherApi instance) =>
    <String, dynamic>{
      'main': instance.main,
      'clouds': instance.clouds,
      'name': instance.name,
    };
