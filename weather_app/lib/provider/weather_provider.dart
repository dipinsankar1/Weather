import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  String apiKey = 'f1a7ec159b18115d41e386b1ebda37bf';
  bool isLoading = false;
  bool isRequestError = false;
  Weather? weather;
  String dateText = '';

   getDate() {
    final now = DateTime.now();
    dateText = DateFormat('MMMMEEEEd').format(now);
  }


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

      } else {
         isLoading = false;
         isRequestError = true;

      }
     
     

    } catch (error) {
      isLoading = false;
      isRequestError = true;
    }

    notifyListeners();
  }

}

