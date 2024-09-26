
class WeatherModel{
   final String icon; // New field for storing icon code
 final String CityName;
 final double maxtemp;
 final double mintemp;
 final double avtemp;
 final String status;

 WeatherModel({
   required this.icon, // Initialize the icon
  required this.CityName,
  required this.avtemp,
  required this.maxtemp,
  required this.mintemp,
  required this.status});
  
factory WeatherModel.fromJson(Json){
  

  return WeatherModel(
     icon: Json['weather'][0]['icon'], // Capture the icon code
    CityName: Json['name'], //correct
    avtemp:Json['main']['temp'], //correct
    //date:Json['dt'] ,
    maxtemp: Json['main']['temp_max'], //correct
    mintemp: Json['main']['temp_min'], //correct
    status: Json['weather'][0]['description']); //correct
}

 // Method to get the full icon URL from OpenWeatherMap
  String getIconUrl() {
    return 'https://openweathermap.org/img/wn/$icon@2x.png';
  }
}