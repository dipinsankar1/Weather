import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  String apiKey = 'f1a7ec159b18115d41e386b1ebda37bf';
  bool isLoading = false;
  bool isRequestError = false;
 Weather? weather;


 Future<void> getCurrentWeather(LatLng location) async {
    isLoading = true;
  
    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey',
    );
    try {
      
      final response = await http.get(url);
      if(response.statusCode == 200) {
         final extractedData = json.decode(response.body) as Map<String, dynamic>;
       isLoading = false;


      weather = Weather.fromJson(extractedData);

      print(isLoading);
     
      print('Fetched Weather for: ${weather?.city}/${weather?.countryCode}');

      } else {
         isLoading = false;
          print(response.statusCode.toString());

      }
     
     

    } catch (error) {
      print(error);
      isLoading = false;
      isRequestError = true;
    }

    notifyListeners();
  }

}

