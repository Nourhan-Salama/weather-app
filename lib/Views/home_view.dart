import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/search_view.dart';
import 'package:weather_app/Views/weather_info.dart';
import 'package:weather_app/Views/weather_page.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status,
        ),
        actions: [IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)
          {
            return SearchView();
          }));
        },
         icon: Icon(Icons.search),
         ),
         ],
         
         
      ),
      
      body:BlocBuilder<GetWeatherCubit,WeatherState> (
        builder: (context, state) 
        {
          if(state is WeatherInitialState)
          {
             print('Initial state');
            return WeatherInfo();
          }
          else if (state is WeatherLoadedState)
          {
              print('WeatherLoadedState reached');
            return WeatherPage(
              weather: state.weatherModel,
            );
          }
          else 
          {
            print('error');
            return Text('opps there are an error');
          }
        
        },
      )
      
    );
  }
}