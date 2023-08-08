import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:login/constants/constants.dart';
import 'package:login/models/weather_api/weather_api.dart';

class WeatherApiFetching {
  Dio dio = Dio();
  Future<WeatherApi?> getWeather(String cityName) async {
    try {
      final response =
          await dio.get('$baseUrl/data/2.5/weather?q=$cityName&appid=$apiKey');
      if (response.statusCode == 200) {
        final res = WeatherApi.fromJson(response.data);
        log(res.main!.pressure.toString());

        return res;
      }
    } catch (e) {
      print('Incurrect name');
    }
  }
}
