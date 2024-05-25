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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    locationData[index].name,
                                    style: const TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),
                                  ),
                                ),
                  ),
                              const SizedBox(width: 50.0,),
                              Container(
                              height: 120,
                              width: 85,
                                // height: MediaQuery.of(context).size.height * .12,
                                // width: MediaQuery.of(context).size.height * .10,
                                decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage(locationData[index].locationImage), fit: BoxFit.fill)
                              ),),

              ],),
             
              ),
            ),
          );
        });
  }
}