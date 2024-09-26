import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/home_view.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
//import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      primarySwatch: getThemeColor(
                          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status
                          ),
                    ),
                    home: HomeView(),
                  );
                },
              )),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if(condition == null)
  {
    return Colors.blue;
  }
   else if (condition == 'clear sky') {
    return Colors.orange;
  } else if (condition == 'few clouds' ||
      condition == 'scattered clouds' ||
      condition == 'broken clouds' ||
      condition == 'overcast clouds') {
    return Colors.grey;
  } else if (condition == 'light rain' ||
      condition == 'moderate rain' ||
      condition == 'heavy intensity rain' ||
      condition == 'very heavy rain' ||
      condition == 'extreme rain' ||
      condition == 'freezing rain' ||
      condition == 'light intensity shower rain' ||
      condition == 'shower rain' ||
      condition == 'heavy intensity shower rain' ||
      condition == 'ragged shower rain') {
    return Colors.blueGrey;
  } else if (condition == 'thunderstorm' ||
      condition == 'thunderstorm with light rain' ||
      condition == 'thunderstorm with rain' ||
      condition == 'thunderstorm with heavy rain' ||
      condition == 'light thunderstorm' ||
      condition == 'heavy thunderstorm' ||
      condition == 'ragged thunderstorm' ||
      condition == 'thunderstorm with light drizzle' ||
      condition == 'thunderstorm with drizzle' ||
      condition == 'thunderstorm with heavy drizzle') {
    return Colors.blue;
  } else if (condition == 'snow' ||
      condition == 'light snow' ||
      condition == 'heavy snow' ||
      condition == 'sleet' ||
      condition == 'light shower sleet' ||
      condition == 'shower sleet' ||
      condition == 'light rain and snow' ||
      condition == 'rain and snow' ||
      condition == 'light shower snow' ||
      condition == 'shower snow' ||
      condition == 'heavy shower snow') {
    return Colors.blueGrey;
  } else if (condition == 'mist' ||
      condition == 'smoke' ||
      condition == 'haze' ||
      condition == 'sand/ dust whirls' ||
      condition == 'fog' ||
      condition == 'sand' ||
      condition == 'dust' ||
      condition == 'volcanic ash' ||
      condition == 'squalls' ||
      condition == 'tornado') {
    return Colors.grey;
  } else if (condition == 'drizzle' ||
      condition == 'light intensity drizzle' ||
      condition == 'drizzle rain' ||
      condition == 'heavy intensity drizzle' ||
      condition == 'heavy intensity drizzle rain' ||
      condition == 'light intensity drizzle rain' ||
      condition == 'shower rain and drizzle' ||
      condition == 'heavy shower rain and drizzle' ||
      condition == 'shower drizzle') {
    return Colors.blueGrey;
  } 
  else{
    return Colors.green;
  }
}
