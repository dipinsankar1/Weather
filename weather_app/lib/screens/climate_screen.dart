import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/custom_shimmer.dart';


class ClimateScreen extends StatefulWidget {
  final Location locationDatas; 
  const ClimateScreen({required this.locationDatas,super.key});


  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestWeather();
  }

   Future<void> requestWeather() async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getCurrentWeather(LatLng(widget.locationDatas.latitude, widget.locationDatas.longitude));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('LOCATION'),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProv, _) {
        
          return weatherProv.isLoading? const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomShimmer(
                height: 148.0,
                width: 148.0,
              ),
            ),
            SizedBox(width: 16.0),
            CustomShimmer(
              height: 148.0,
              width: 148.0,
            ),
          ],
        ):  Column(
            children: [
              Text(widget.locationDatas.name),
              Text('Description: ${weatherProv.weather?.description}' ?? "Data not available",),
              Text('Humidity:${weatherProv.weather?.humidity.toString()}' ?? "Data not available",),
              Text('tem:${weatherProv.weather?.temp.toString()}' ?? "Data not available",),
              Text('Max Tem:${weatherProv.weather?.tempMax.toString()}' ?? "Data not available",),
              Text('Min Tem:${weatherProv.weather?.tempMin.toString()}' ?? "Data not available",),
              Text('Wind speed:${weatherProv.weather?.windSpeed.toString()}' ?? "Data not available",),
              SizedBox(
                  height: 148.0,
                  width: 148.0,
                  child: Image.asset(
                    getWeatherImage(weatherProv.weather?.weatherCategory ?? ''),
                    fit: BoxFit.cover,
                  ),),
            ],
          );
        }
      ),
    );
  }
}