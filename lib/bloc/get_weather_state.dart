part of 'get_weather_bloc.dart';

 class GetWeatherState {
  final String cityName;

  GetWeatherState({required this.cityName});
}

final class GetWeatherInitial extends GetWeatherState {
  GetWeatherInitial({required super.cityName});
}
