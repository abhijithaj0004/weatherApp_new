import 'package:bloc/bloc.dart';

part 'get_weather_event.dart';
part 'get_weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherBloc() : super(GetWeatherInitial(cityName: 'City')) {
    on<CityNameChange>((event, emit) {
      getCityName(String cityName) {
        emit(GetWeatherState(cityName: cityName));
      }
    });
  }
}
