import 'dart:convert';  // Importing the dart:convert library for JSON encoding and decoding

import 'package:flutter/material.dart';  // Importing the Flutter Material package for UI components
import 'package:intl/intl.dart';  // Importing the intl package for date formatting
import 'package:latlong2/latlong.dart';  // Importing latlong2 package for geographical coordinates handling
import 'package:http/http.dart' as http;  // Importing the http package for making HTTP requests
import 'package:weather_app/model/weather_model.dart';  // Importing the Weather model from the weather app

class WeatherProvider with ChangeNotifier {  // Defining a WeatherProvider class that extends ChangeNotifier for state management
  String apiKey = 'YOUR WEATHERMAP API KEY';  // Storing the API key for OpenWeatherMap
  bool isLoading = false;  // Boolean to track if data is currently being loaded
  bool isRequestError = false;  // Boolean to track if there was an error in the request
  Weather? weather;  // Variable to hold the current weather data
  String dateText = '';  // Variable to hold the formatted date text

  getDate() {  // Method to get the current date and format it
    final now = DateTime.now();  // Getting the current date and time
    dateText = DateFormat('MMMMEEEEd').format(now);  // Formatting the date into a readable string
  }

  Future<void> getCurrentWeather(LatLng location) async {  // Asynchronous method to get current weather data
    isLoading = true;  // Setting isLoading to true to indicate loading process
  
    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey',
    );  // Constructing the URL for the weather API request
    try {
      final response = await http.get(url);  // Making the HTTP GET request
      if(response.statusCode == 200) {  // Checking if the response status is OK
        final extractedData = json.decode(response.body) as Map<String, dynamic>;  // Decoding the JSON response
        isLoading = false; // Setting isLoading to false as loading is complete
        isRequestError = false; 
        weather = Weather.fromJson(extractedData);  // Parsing the weather data into the Weather model
      } else {
        isLoading = false;  // Setting isLoading to false as loading is complete
        isRequestError = true;  // Setting isRequestError to true as there was an error in the response
      }
    } catch (error) {  // Catching any errors that occur during the HTTP request
      isLoading = false;  // Setting isLoading to false as loading is complete
      isRequestError = true;  // Setting isRequestError to true as there was an error in the request
    }
    notifyListeners();  // Notifying listeners to rebuild the UI with the new state
  }
}
