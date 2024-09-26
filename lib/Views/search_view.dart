
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';


class SearchView extends StatelessWidget {
  // final WeatherModel weather;
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search your City'),
        backgroundColor: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status,
        ),
        

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              print('Submitted city: $value');
             var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              print('Cubit: $getWeatherCubit');
              if (getWeatherCubit != null) {
                  getWeatherCubit.getWeather(cityName: value);
                  print('getWeather called for city: $value');
                }
             
              Navigator.pop(context);
            },
            decoration:InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16,
              vertical: 32),
              hintText: 'Enter your city',
              suffixIcon: Icon(Icons.search),
              labelText:'Search' ,
              border:OutlineInputBorder(
             
              borderSide: BorderSide(
                color:Colors.green ) , 
              ),
            ) ,
          ),
          ),
      ),
    );
  }
}

