import 'package:flutter/material.dart';
import 'package:weather_app/data/location_data.dart';
import 'package:weather_app/screens/climate_screen.dart';

class LocationGrid extends StatelessWidget {
  const LocationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: locationData.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              debugPrint(locationData[index].name);
               Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>
                       ClimateScreen(locationDatas:locationData[index],)),);

            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Container(
               decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(locationData[index].backImage), fit: BoxFit.fill),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            locationData[index].name,
                            style: const TextStyle(color: Colors.black),
                          ),
                        
                        ],
                      ),
                     
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}