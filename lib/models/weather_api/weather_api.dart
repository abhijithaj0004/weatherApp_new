import 'package:json_annotation/json_annotation.dart';

import 'clouds.dart';
import 'main.dart';

part 'weather_api.g.dart';

@JsonSerializable()
class WeatherApi {
  Main? main;
  Clouds? clouds;
  String? name;

  WeatherApi({this.main, this.clouds,this.name});

  factory WeatherApi.fromJson(Map<String, dynamic> json) {
    return _$WeatherApiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}
