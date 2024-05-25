import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/constant.dart';
import 'package:weather_app/provider/weather_provider.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
              minWidth: 100,
              maxHeight: MediaQuery.sizeOf(context).height / 3,
            ),
            child: Image.asset('assets/icons/error.png'),
          ),
           Center(
            child: Text(
              'Request Error',
              style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 20.0,),),
            ),
          ),
          const SizedBox(height: 4.0),
          Center(
            child: Text(
              'Request error, please check your internet connection',
              style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 18.0,),),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
            return SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kLightBlue,
                  //textStyle: mediumText,
                  padding: const EdgeInsets.all(12.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text('Return Home'),
                onPressed: (){
                  Navigator.pop(context);
                },
              
              ),
            );
          }),
        ],
      ),
    );
  }
}