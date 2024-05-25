import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/location_grid.dart';



class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

   @override
  void initState() {
   
    super.initState();
    requestDate();
  }

  Future<void> requestDate() async {
    await Provider.of<WeatherProvider>(context, listen: false)
        .getDate();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Location',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
          LocationGrid(),
        ],),
      ),
    );
  }
}