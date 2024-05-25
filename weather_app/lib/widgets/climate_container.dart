import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/helper/constant.dart';

class ClimateContainer extends StatelessWidget {
  final String name;
  final String value;
  const ClimateContainer({ required this.name,required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kLightBlue,
                  ),
      child:  Column(
                   children: [
                              const SizedBox(height: 10.0,),
                                Text(name,
                                 style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 18.0,)),
                                //style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.normal,),
                                ),
                               const SizedBox(height: 10.0,),
                               Text(value,
                               style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black,fontSize: 18.0,)),
                               ),
                             ],
                           ),
    );
  }
}