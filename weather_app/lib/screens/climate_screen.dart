import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/utils.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/climate_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/widgets/error_widget.dart';


class ClimateScreen extends StatefulWidget {
  final Location locationDatas; // Declaring a final variable to hold location data
  const ClimateScreen({required this.locationDatas,super.key});


  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {

   @override
  void initState() {    
   
    super.initState();
    requestWeather(); // Requesting weather data when the state initializes
  }

   Future<void> requestWeather() async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getCurrentWeather(LatLng(widget.locationDatas.latitude, widget.locationDatas.longitude));
  }
  @override
  Widget build(BuildContext context) {
    // Using Consumer to listen to WeatherProvider changes
    return  Consumer<WeatherProvider>(
      builder: (context, weatherProv, _) {
        return Scaffold(
          
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title:  Text(weatherProv.dateText,style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 20.0,),),),
          ),
          body: SingleChildScrollView (
            child: weatherProv.isRequestError?const ErrorScreen():weatherProv.isLoading?  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120.0,),
                  // Displaying a loading animation
                  LoadingAnimationWidget.beat(
                    color: Colors.blue,
                    size: 200,
                  ),
                ],
              ),
            ):  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_city_rounded,color: Colors.black,size: 30,),
                    const SizedBox(height: 20.0,),
                    Center(child: Text(widget.locationDatas.name,
                    style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 30.0,),),
                    ),),
                  ],
                ),
                       const SizedBox(height: 15.0,),
                       // Displaying the weather image
                SizedBox(
                    height: MediaQuery.of(context).size.height * .14,
                    width: MediaQuery.of(context).size.height * .14,
                    child: Image.asset(
                      getWeatherImage(weatherProv.weather?.weatherCategory ?? ''),
                      fit: BoxFit.cover,
                    ),),
                        
                    Text('${weatherProv.weather?.temp.toStringAsFixed(0)}°',
                    style: const TextStyle(color: Colors.black,fontSize: 100.0,fontWeight: FontWeight.bold,),
                    ),
                    const SizedBox(height: 10.0,),
                    // Displaying the weather description
                    Text('${weatherProv.weather?.description}',
                    style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 20.0,)),
                    ),
                    const SizedBox(height: 20.0,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(width: 10.0,),
                       ClimateContainer(name:'Max',value:'${weatherProv.weather?.tempMax.toStringAsFixed(0)}°'),
                       const SizedBox(width: 10.0,),
                       ClimateContainer(name:'Min',value:'${weatherProv.weather?.tempMin.toStringAsFixed(0)}°'),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(width: 10.0,),
                       ClimateContainer(name:'Humidity',value:'${weatherProv.weather?.humidity.toString()} %'),
                       const SizedBox(width: 10.0,),
                       ClimateContainer(name:'Wind Speed',value:'${weatherProv.weather?.windSpeed.toString()}'),
                       const SizedBox(width: 10.0,),
                       ClimateContainer(name:'Pressure',value:'${weatherProv.weather?.pressure.toString()}'),
                        
                      ],
                    ),
               
              ],
            ),
          ),
        );
      }
    );
  }
   
}

