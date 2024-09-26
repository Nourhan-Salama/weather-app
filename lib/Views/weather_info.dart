import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('There is no Weather Info 😔'),
                Text('Search Now 🔍')
              ],
            ),
          ),
      )
    );
  }
}