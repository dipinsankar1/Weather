import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/constant.dart';
import 'package:weather_app/provider/weather_provider.dart';

class WeatherGrid extends StatelessWidget {
  const WeatherGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context,weatherProvider,_) {
        return GridView.builder(
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              childAspectRatio: 1,
              crossAxisCount: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kLightBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Humidity',
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff8EA3B7),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 7,
                          decoration: BoxDecoration(
                              color: kDarkBlue,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Text(
                          '${weatherProvider.weather?.humidity.toString()}',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006ED3),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }
}