import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../Services/service_weather.dart';

class GetWeatherCubit extends Cubit <WeatherState>{
   WeatherModel? weatherModel; // Store the weather model directly in the cubit

  GetWeatherCubit() : super(WeatherInitialState());
   getWeather({required String cityName}) async{
   
     try {
           print('Fetching weather for: $cityName');
            weatherModel = await WeatherService(Dio()).getCurrentWeather(CityName: cityName);
print('anything');
           emit(WeatherLoadedState(weatherModel: weatherModel!));
            print('WeatherLoadedState emitted');
          } 
          catch (e) {
             print('Error fetching weather: $e');
          emit(WeatherFailurState(
            errorMsg: e.toString(),
          ));
          }
  }
  
}