import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationWidget extends StatelessWidget {
  final String location;

  const LocationWidget({
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('images/location_pin.png'),
        SizedBox(
          width: 8,
        ),
        Text(
          location,
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
