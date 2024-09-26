import 'package:weather_app/models/weather_model.dart';

class WeatherState{
  
 
}

class WeatherInitialState extends WeatherState{
 
}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}
class WeatherFailurState extends WeatherState{
  final String errorMsg;
  WeatherFailurState({required this.errorMsg});
}