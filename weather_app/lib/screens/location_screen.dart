import 'package:flutter/material.dart';
import 'package:weather_app/widgets/location_grid.dart';



class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('LOCATION'),
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