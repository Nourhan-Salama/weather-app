import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatelessWidget {
  
  final WeatherModel weather;
   WeatherPage({super.key,required this.weather});

   DateTime now = DateTime.now();
   int date = DateTime.now().hour;
  
   int minute = DateTime.now().minute;
  
 
  @override
    Widget build(BuildContext context) {
    // Accessing weatherModel directly from the cubit
    var weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    var weatherModel = weatherCubit.weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.status)[300]!,
            getThemeColor(weatherModel.status)[500]!,
            getThemeColor(weatherModel.status)[100]!,

          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(weatherModel.CityName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                ),
                Text('updated at : ${date}:${minute}'),
                SizedBox(
                  height: 32,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Display the weather icon
                  Image.network(weatherModel.getIconUrl()),
                  Text(weatherModel.avtemp.round().toString(),
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  ),
                  Column(
                    children: [
                      Text('max temp: ${weatherModel.maxtemp.round()}'),
                      Text('min temp: ${weatherModel.mintemp.round()}'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(weatherModel.status,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),),
              ],
            ),
          ),
        ),
    );
    
  }
}

