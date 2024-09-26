

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{
final Dio dio;
final String baseUrl = 'https://api.openweathermap.org/data/2.5';
final String apiKey = '179c533c4af681a25139e301653d55da';
WeatherService(this.dio);
Future<WeatherModel> getCurrentWeather({required String CityName}) async{
  try {
  Response response = await dio.get('$baseUrl/weather?q=$CityName&units=metric&appid=$apiKey');
  
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  return weatherModel;
} on DioException catch (e) {
  final String errorMsg = e.response?.data['message']??'opps there are an error , try later';
  throw Exception(errorMsg);
}
catch (e){
 log(e.toString());
  throw ('opps there are an error, try later ');
}
}

}